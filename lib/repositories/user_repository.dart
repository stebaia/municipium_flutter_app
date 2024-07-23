import 'dart:convert';


import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/user/idp_model.dart';
import 'package:municipium/model/user/spid_object.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/repositories/municipality_repository.dart';
import 'package:municipium/services/network/api/auth_spid_service/auth_spid_service.dart';
import 'package:municipium/utils/secure_storage.dart';

class UserRepository {
  UserRepository({required this.secureStorage, required this.municipalityRepository, required this.authSpidService});
  final SecureStorage secureStorage;
  final MunicipalityRepository municipalityRepository;
  final AuthSpidService authSpidService;
  
  
  Future<List<UserConfigurationMenu>> initUserMenuInShared() async {
    //PRENDERE I MENU DALLA NEW MOBILE
    //CREAZIONE DELL'OGGETTO DA SALVARE NELLE SHARED
    Municipality? municipality = await municipalityRepository.currentMunicipality;
    List<UserConfigurationMenu> listOfConfiguration = [];
    if(municipality != null) {
      listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Info comune', isMandatory: true, position: 1));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: municipality.appServiceOne, isMandatory: false, position: 2));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: municipality.appServiceTwo, isMandatory: false, position: 3));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: municipality.appServiceThree, isMandatory: false, position: 4));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: municipality.appServiceFour, isMandatory: false, position: 5));
      
    }else {
      listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Info', isMandatory: true, position: 1));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Notizie', isMandatory: false, position: 2));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Eventi', isMandatory: false, position: 3));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Poi', isMandatory: false, position: 4));
      listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Segnalazioni', isMandatory: false, position: 5));
    }
    
    
    String jsonListOfConfiguration = jsonEncode(listOfConfiguration.map((e) => e.toJson()).toList());

    secureStorage.setConfigurationMenu(jsonListOfConfiguration);

    return listOfConfiguration;
  }

  Future<List<IdpModel>> getIdps() async {
    try {
      final responseIdps = await authSpidService.getIdps();
      return responseIdps;
    }catch (e) {
      rethrow;
    }
  }

  


}