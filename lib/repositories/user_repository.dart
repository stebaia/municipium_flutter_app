import 'dart:convert';

import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/utils/secure_storage.dart';

class UserRepository {
  UserRepository({required this.secureStorage});
  final SecureStorage secureStorage;

  List<UserConfigurationMenu> initUserMenuInShared() {
    //PRENDERE I MENU DALLA NEW MOBILE
    //CREAZIONE DELL'OGGETTO DA SALVARE NELLE SHARED
    List<UserConfigurationMenu> listOfConfiguration = [];
    listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Info', isMandatory: true, position: 1));
    listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Notizie', isMandatory: false, position: 2));
    listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Eventi', isMandatory: false, position: 3));
    listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Poi', isMandatory: false, position: 4));
    listOfConfiguration.add(UserConfigurationMenu(serviceName: 'Segnalazioni', isMandatory: false, position: 5));
    String jsonListOfConfiguration = jsonEncode(listOfConfiguration.map((e) => e.toJson()).toList());

    secureStorage.setConfigurationMenu(jsonListOfConfiguration);

    return listOfConfiguration;
    
  }


}