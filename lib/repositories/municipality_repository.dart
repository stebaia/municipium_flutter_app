import 'dart:io';

import 'package:logger/logger.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/api/municipality_be_service/municipality_be_service.dart';
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
  final SecureStorage secureStorage;
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
      required this.municipalityBeService,
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

  Future<Municipality> saveMunicipality(int municipalityId) async {
    try {
      final municipalityResponse =
          await municipalityService.getMunicipality(municipalityId);
      final municipality = municipalityMapper.fromDTO(municipalityResponse);
      await secureStorage
          .setMunicipalityKeyInStorage(munMapper.from(municipality));
      return municipality;
    } catch (error, stackTrace) {
      logger.e('Error in getting municipality');
      rethrow;
    }
  }

  Future<Municipality?> getMunicipalityFromOneSignal() async {
    //OneSignal.U
    final String? playerId = await OneSignal.User.getOnesignalId();
    final String? pushId = await OneSignal.User.getExternalId();
    Map<String, String> oneSignalTag = await OneSignal.User.getTags();
    final deviceBeStorage = await getCurrentDevice();
    if(oneSignalTag['municipalityId'] != null) {
      int municipalityIdFromOS = int.parse(oneSignalTag['municipalityId']!);     
      if(deviceBeStorage == null) {
        //HO LA MUNICIPALITY MA NON HO L'ID
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String version = packageInfo.version;
        String code = packageInfo.buildNumber;
        String platform = '';
        if(Platform.isAndroid){
          platform = 'android';
        }else {
          platform = 'ios';
        }
        DeviceBe deviceBe = DeviceBe(playerId: playerId!, authToken: '', token: '', platform: platform, appVersion: version, udid: '', language: '');
        final responseBePut = await municipalityBeService.putDevices(deviceBe);
        deviceBe.udid = responseBePut.udid;
        await secureStorage.setDeviceKeyInStorage(deviceMapper.from(deviceBe));
        //GET MUNICIPALITY AND RETURN
        final municipality = saveMunicipality(int.parse(oneSignalTag['municipalityId']!));
        return municipality;
      } else {
        final municipality = saveMunicipality(int.parse(oneSignalTag['municipalityId']!));
        return municipality;
         //HO TUTTO E SONO A POSTO
         //GET MUNICIPALITY AND RETURN
      }
    }else if(oneSignalTag['municipalityId'] == null && deviceBeStorage != null) {
      final responseBePost = await municipalityBeService.postDevices(deviceBeStorage);
      //RICHIAMO LA POST A DEVICES
      //RICHIAMO LA MUNICIPALITY SUBSCRIPTION
      //SE RITORNA 
    }
  }




  Future<Municipality?> getMunicipalityFromSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? municipality = preferences.getString('municipality-object');
    if(municipality != null) {
      print(municipality);
    }else {
      print('no old muniicipality');
    }
  }

  Future<DeviceBe?> getCurrentDevice() async {
    final json = await secureStorage.getDeviceFromStorage();
    if(json != null) {
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
