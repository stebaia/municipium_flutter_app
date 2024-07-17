import 'dart:io';

import 'package:logger/logger.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';

import 'package:municipium/services/network/api/municipality_be_service/municipality_be_service.dart';
import 'package:municipium/services/network/api/municipality_configuration_service/municipality_configuration_service.dart';
import 'package:municipium/services/network/api/municipality_service/municipality_service.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:pine/utils/mapper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MunicipalityRepository {
  final Mapper<Municipality, String> munMapper;
  final Mapper<DeviceBe, String> deviceMapper;
  final Mapper<Configurations, String> configurationsMapper;
  final SecureStorage secureStorage;
  final MunicipalityConfigurationService configurationService;
  final MunicipalityService municipalityService;
  final MunicipalityBeService municipalityBeService;
  final DTOMapper<MunicipalityDTO, Municipality> municipalityMapper;
  final Logger logger;

  MunicipalityRepository(
      {required this.munMapper,
      required this.secureStorage,
      required this.deviceMapper,
      required this.municipalityService,
      required this.municipalityMapper,
      required this.configurationService,
      required this.municipalityBeService,
      required this.configurationsMapper,
      required this.logger});

  Future<List<Municipality>> getMunicipalityList() async {
    try {
      final municipalityResponse =
          await municipalityService.getListMunicipality();
      final List<Municipality> municipalities = [];
      municipalityResponse.forEach((element) {
        municipalities.add(municipalityMapper.fromDTO(element));
      });
      return municipalities;
    } catch (error) {
      logger.e(error.toString());
      rethrow;
    }
  }

  Future<List<Municipality>> getMunicipalityListFromPosition(
      double lat, double lng) async {
    try {
      final municipalityResponse =
          await municipalityService.getListMunicipalityWithLatLng(lat, lng);
      final List<Municipality> municipalities = [];
      municipalityResponse.forEach((element) {
        municipalities.add(municipalityMapper.fromDTO(element));
      });
      return municipalities;
    } catch (error) {
      logger.e(error.toString());
      rethrow;
    }
  }

  void addUserConfigurationMenus(
      Municipality municipality, List<UserConfigurationMenu> listWrapped) {
    // Aggiungi news
    if (municipality.newMenu.news != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.news!,
          isMandatory: false,
          position: 0));
    }
    // Aggiungi issue
    if (municipality.newMenu.issue != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.issue!,
          isMandatory: false,
          position: 1));
    }
    // Aggiungi penalties
    if (municipality.newMenu.penalties != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.penalties!,
          isMandatory: false,
          position: 2));
    }
    // Aggiungi surveys
    if (municipality.newMenu.surveys != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.surveys!,
          isMandatory: false,
          position: 3));
    }
    // Aggiungi garbage
    if (municipality.newMenu.garbage != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.garbage!.toString(),
          isMandatory: false,
          position: 4));
    }
    // Aggiungi ecoattivi
    if (municipality.newMenu.ecoattivi != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.ecoattivi!,
          isMandatory: false,
          position: 5));
    }
    // Aggiungi poi
    if (municipality.newMenu.poi != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.poi!,
          isMandatory: false,
          position: 6));
    }
    // Aggiungi services
    if (municipality.newMenu.services != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.services!,
          isMandatory: false,
          position: 7));
    }
    // Aggiungi dms
    if (municipality.newMenu.dms != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.dms!.toString(),
          isMandatory: false,
          position: 8));
    }
    // Aggiungi digitalDossier
    if (municipality.newMenu.digitalDossier != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.digitalDossier!,
          isMandatory: false,
          position: 9));
    }
    // Aggiungi civilDefence
    if (municipality.newMenu.civilDefence != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.civilDefence!.toString(),
          isMandatory: false,
          position: 10));
    }
    // Aggiungi payment
    if (municipality.newMenu.payment != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.payment!,
          isMandatory: false,
          position: 11));
    }
    // Aggiungi events
    if (municipality.newMenu.events != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.events!,
          isMandatory: false,
          position: 12));
    }
    // Aggiungi sportelloTelematico
    if (municipality.newMenu.sportelloTelematico != null) {
      listWrapped.add(UserConfigurationMenu(
          serviceName: municipality.newMenu.sportelloTelematico!,
          isMandatory: false,
          position: 13));
    }
  }

  Future<Municipality> saveMunicipality(int municipalityId) async {
    try {
      final municipalityResponse =
          await municipalityService.getMunicipality(municipalityId);
      final municipality = municipalityMapper.fromDTO(municipalityResponse);
      municipality.configurations = await getConfigurationsAndSave(
          "https://${municipality.subdomain}/api/v2/");
      await secureStorage
          .setMunicipalityKeyInStorage(munMapper.from(municipality));
      final deviceBeStorage = await getCurrentDevice();
      final String? playerId = await OneSignal.User.getOnesignalId();
      if (deviceBeStorage == null) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String version = packageInfo.version;
        String code = packageInfo.buildNumber;
        String platform = '';
        if (Platform.isAndroid) {
          platform = 'android';
        } else {
          platform = 'ios';
        }
        DeviceBe deviceBe = DeviceBe(
            playerId: playerId!,
            authToken: '',
            token: '',
            platform: platform,
            appVersion: version,
            udid: '',
            language: '');
        final responseBePut = await municipalityBeService.putDevices(deviceBe);
        deviceBe.udid = responseBePut.udid;
        await secureStorage.setDeviceKeyInStorage(deviceMapper.from(deviceBe));
        Map<String, dynamic> map = {
          "municipalityId": municipalityId,
          "udid": deviceBe.udid
        };
        OneSignal.User.addTags(map);
      } else {
        Map<String, dynamic> map = {
          "municipalityId": municipalityId,
          "udid": deviceBeStorage.udid
        };
        OneSignal.User.addTags(map);
      }

      return municipality;
    } catch (error, stackTrace) {
      logger.e('Error in getting municipality');
      rethrow;
    }
  }

  Future<Configurations?> getConfigurationsAndSave(String baseUrl) async {
    try {
      final Configurations configurations =
          await configurationService.getMunicipalityConfigurations(baseUrl);
      return configurations;
    } catch (ex) {
      logger.e(ex);
    }
  }

  Future<Municipality?> getMunicipalityFromOneSignal() async {
    //OneSignal.U
    final String? playerId = await OneSignal.User.getOnesignalId();
    final String? pushId = await OneSignal.User.getExternalId();
    Map<String, String> oneSignalTag = await OneSignal.User.getTags();
    final deviceBeStorage = await getCurrentDevice();
    if (oneSignalTag['municipalityId'] != null) {
      int municipalityIdFromOS = int.parse(oneSignalTag['municipalityId']!);
      if (deviceBeStorage == null) {
        //HO LA MUNICIPALITY MA NON HO L'ID
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String version = packageInfo.version;
        String code = packageInfo.buildNumber;
        String platform = '';
        if (Platform.isAndroid) {
          platform = 'android';
        } else {
          platform = 'ios';
        }
        DeviceBe deviceBe = DeviceBe(
            playerId: playerId!,
            authToken: '',
            token: '',
            platform: platform,
            appVersion: version,
            udid: '',
            language: '');
        final responseBePut = await municipalityBeService.putDevices(deviceBe);
        deviceBe.udid = responseBePut.udid;
        await secureStorage.setDeviceKeyInStorage(deviceMapper.from(deviceBe));
        //GET MUNICIPALITY AND RETURN
        final municipality =
            saveMunicipality(int.parse(oneSignalTag['municipalityId']!));
        return municipality;
      } else {
        final municipality =
            saveMunicipality(int.parse(oneSignalTag['municipalityId']!));
        return municipality;
        //HO TUTTO E SONO A POSTO
        //GET MUNICIPALITY AND RETURN
      }
    } else if (oneSignalTag['municipalityId'] == null &&
        deviceBeStorage != null) {
      final responseBePost =
          await municipalityBeService.postDevices(deviceBeStorage);
      //RICHIAMO LA POST A DEVICES
      //RICHIAMO LA MUNICIPALITY SUBSCRIPTION
      //SE RITORNA
    }
  }

  Future<Municipality?> getMunicipalityFromSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? municipality = preferences.getString('municipality-object');
    if (municipality != null) {
      print(municipality);
    } else {
      print('no old municipality');
    }
  }

  Future<Configurations?> getMunicipalityConfigurations() async {
    final json = await secureStorage.getConfigurationsFromStorage();
    if (json != null) {
      return configurationsMapper.to(json);
    }
    return null;
  }

  Future<DeviceBe?> getCurrentDevice() async {
    final json = await secureStorage.getDeviceFromStorage();
    if (json != null) {
      return deviceMapper.to(json);
    }
    return null;
  }

  Future<Municipality?> get currentMunicipality async {
    final json = await secureStorage.getMunicipalityFromStorage();
    if (json != null) {
      return munMapper.to(json);
    }
    return null;
  }
}
