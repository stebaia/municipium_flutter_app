import 'dart:convert';

import 'package:municipium/model/dashboard_menu/dashboard_menu.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/requests/request_logout_spid.dart';
import 'package:municipium/model/user/idp_model.dart';
import 'package:municipium/model/user/spid_object.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/repositories/municipality_repository.dart';
import 'package:municipium/services/network/api/auth_spid_service/auth_spid_service.dart';
import 'package:municipium/services/network/api/mmc_municipium_service/mmc_municipium_service.dart';
import 'package:municipium/services/network/api/municipality_service/municipality_service.dart';
import 'package:municipium/utils/secure_storage.dart';

class UserRepository {
  UserRepository(
      {required this.secureStorage,
      required this.municipalityRepository,
      required this.authSpidService,
      required this.mmcMunicipiumService,
      required this.municipalityService});
  final SecureStorage secureStorage;
  final MunicipalityService municipalityService;
  final MunicipalityRepository municipalityRepository;
  final MmcMunicipiumService mmcMunicipiumService;
  final AuthSpidService authSpidService;

  Future<List<UserConfigurationMenu>> getMunicipalityUserService(
      String baseUrl, String municipalityId) async {
    final List<DashboardMenu> response = await municipalityService
        .getMunicipalityDashboard(baseUrl, municipalityId);

    List<UserConfigurationMenu> listOfConfiguration = [];

    for (final dashboardMenu in response) {
      listOfConfiguration.add(UserConfigurationMenu(
          serviceName: dashboardMenu.serviceName,
          isMandatory: dashboardMenu.isMandatory,
          position: dashboardMenu.position,
          assetImage: dashboardMenu.image,
          slug: dashboardMenu.slug));
    }

    return listOfConfiguration;
  }

  Future<List<UserConfigurationMenu>> initUserMenuInShared(
      String baseUrl, String municipalityId) async {
    final savedConfiguraton = await secureStorage.getConfigurationMenu();
    List<UserConfigurationMenu> listOfConfiguration = [];

    if (savedConfiguraton != null) {
      List<dynamic> decodedList = jsonDecode(savedConfiguraton);
      listOfConfiguration =
          decodedList.map((e) => UserConfigurationMenu.fromJson(e)).toList();
    } else {
      final List<DashboardMenu> response = await municipalityService
          .getMunicipalityDashboard(baseUrl, municipalityId);

      for (final dashboardMenu in response.take(4)) {
        listOfConfiguration.add(UserConfigurationMenu(
            serviceName: dashboardMenu.serviceName,
            isMandatory: dashboardMenu.isMandatory,
            position: dashboardMenu.position,
            assetImage: dashboardMenu.image,
            slug: dashboardMenu.slug));
      }

      String jsonListOfConfiguration =
          jsonEncode(listOfConfiguration.map((e) => e.toJson()).toList());

      secureStorage.setConfigurationMenu(jsonListOfConfiguration);
    }

    return listOfConfiguration;
  }

  Future<void> updateConfiguration(
      UserConfigurationMenu config, int index) async {
    final savedConfiguraton = await secureStorage.getConfigurationMenu();
    List<UserConfigurationMenu> listOfConfiguration = [];

    if (savedConfiguraton != null) {
      List<dynamic> decodedList = jsonDecode(savedConfiguraton);
      listOfConfiguration =
          decodedList.map((e) => UserConfigurationMenu.fromJson(e)).toList();
      listOfConfiguration[index] = config;
    }

    String jsonListOfConfiguration =
        jsonEncode(listOfConfiguration.map((e) => e.toJson()).toList());

    secureStorage.setConfigurationMenu(jsonListOfConfiguration);
  }

  Future<void> resetConfiguration(List<UserConfigurationMenu> conf) async {
    String jsonListOfConfiguration =
        jsonEncode(conf.map((e) => e.toJson()).toList());

    secureStorage.setConfigurationMenu(jsonListOfConfiguration);
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
          baseUrlMmc, authId, municipalityId, authSystem, authIdOld);
      return spidUser;
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> logoutUser(
    String baseUrlMmc,
    String playerId,
    String cf,
    String udid,
  ) async {
    try {
      RequestLogoutSpidId requestLogoutSpidId =
          RequestLogoutSpidId(playerId: playerId, cf: cf, udid: udid);
      RequestLogoutSpid requestLogoutSpid =
          RequestLogoutSpid(id: requestLogoutSpidId);
      final response =
          await mmcMunicipiumService.logoutSpid(baseUrlMmc, requestLogoutSpid);
      return response.response.statusCode == 200;
    } catch (ex) {
      rethrow;
    }
  }
}
