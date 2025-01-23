import 'dart:convert';

import 'package:municipium/model/basic_response.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/user/idp_model.dart';
import 'package:municipium/model/user/spid_object.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/repositories/mappers/ecoattivi_mapper/user_to_validate_mapper.dart';
import 'package:municipium/repositories/municipality_repository.dart';
import 'package:municipium/services/network/api/auth_spid_service/auth_spid_service.dart';
import 'package:municipium/services/network/api/mmc_municipium_service/mmc_municipium_service.dart';
import 'package:municipium/services/network/dto/user_to_validate_dto.dart';
import 'package:municipium/services/network/dto/user_validated.dart';
import 'package:municipium/utils/secure_storage.dart';

class UserRepository {
  UserRepository(
      {required this.secureStorage,
      required this.municipalityRepository,
      required this.authSpidService,
      required this.mmcMunicipiumService});
  final SecureStorage secureStorage;
  final MunicipalityRepository municipalityRepository;
  final MmcMunicipiumService mmcMunicipiumService;
  final AuthSpidService authSpidService;

  Future<List<UserConfigurationMenu>> initUserMenuInShared() async {
    //PRENDERE I MENU DALLA NEW MOBILE
    //CREAZIONE DELL'OGGETTO DA SALVARE NELLE SHARED
    Municipality? municipality =
        await municipalityRepository.currentMunicipality;
    List<UserConfigurationMenu> listOfConfiguration = [];
    if (municipality != null) {
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: 'Info comune',
          isMandatory: true,
          position: 1));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: municipality.appServiceOne,
          isMandatory: false,
          position: 2));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: municipality.appServiceTwo,
          isMandatory: false,
          position: 3));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: municipality.appServiceThree,
          isMandatory: false,
          position: 4));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: municipality.appServiceFour,
          isMandatory: false,
          position: 5));
    } else {
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: 'Info',
          isMandatory: true,
          position: 1));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: 'Notizie',
          isMandatory: false,
          position: 2));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: 'Eventi',
          isMandatory: false,
          position: 3));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: 'Poi',
          isMandatory: false,
          position: 4));
      listOfConfiguration.add(UserConfigurationMenu(
          assetImage: 'assets/images/illustration_categories_info_comune.png',
          serviceName: 'Segnalazioni',
          isMandatory: false,
          position: 5));
    }

    String jsonListOfConfiguration =
        jsonEncode(listOfConfiguration.map((e) => e.toJson()).toList());

    secureStorage.setConfigurationMenu(jsonListOfConfiguration);

    return listOfConfiguration;
  }

  Future<List<IdpModel>> getIdps(
    String baseUrlMmc,
  ) async {
    try {
      final responseIdps = await authSpidService.getIdps(baseUrlMmc);
      return responseIdps;
    } catch (e) {
      rethrow;
    }
  }

  Future<SpidUserModel> getUserSpid(String baseUrlMmc, String authId,
      String municipalityId, String authSystem, String authIdOld) async {
    try {
      final spidUser = await mmcMunicipiumService.retriveUserData(
        baseUrlMmc,
        authId,
        municipalityId,
        authSystem,
      );
      return spidUser;
    } catch (ex) {
      rethrow;
    }
  }

  Future<UserValidated> validateUserSpid(
      String baseUrlMmc,
      SpidUserModel user,
      String token,
      int istat,
      String service,
      String codiceAmico,
      bool privacy) async {
    try {
      UserToValidateDto userToValidateDto = UserToValidateMapper.convert(
          user, istat, token, service, codiceAmico, privacy);
      final userValidated = await mmcMunicipiumService.validateUser(
          baseUrlMmc, userToValidateDto);
      if (userValidated.data != null) {
        secureStorage.setEcoattiviToken(userValidated.data!.token ?? '');
      }
      return userValidated;
    } catch (ex) {
      rethrow;
    }
  }

  Future<String> getInfo(String baseUrl, String info) async {
    try {
      final response =
          await mmcMunicipiumService.getInfoTerminiPrivacy(baseUrl, info);
      if (response.description != null) {
        return response.description!;
      }
      return '';
    } catch (ex) {
      rethrow;
    }
  }
}
