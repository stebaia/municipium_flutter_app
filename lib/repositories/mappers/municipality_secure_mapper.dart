import 'dart:convert';

import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/services/network/dto/new_menu_dto.dart';
import 'package:pine/pine.dart';

class MunicipalitySecureMapper extends Mapper<Municipality, String> {
  @override
  String from(Municipality from) => jsonEncode(<String, dynamic>{
        'name': from.municipalityName,
        'id': from.muninicipalityId,
        'subdomain': from.subdomain,
        'lat': from.lat,
        'lng': from.lng,
        'logo': from.logo.toJson(),
        'background': from.background.toJson(),
        'appServiceOne': from.appServiceOne,
        'appServiceTwo': from.appServiceTwo,
        'appServiceThree': from.appServiceThree,
        'appServiceFour': from.appServiceFour,
        'new_menu':
            from.newMenu.toJson() // Serializza l'oggetto MunicipiumImage
      });

  @override
  Municipality to(String to) {
    final json = jsonDecode(to);
    return Municipality(
        municipalityName: json['name'],
        muninicipalityId: json['id'],
        lat: json['lat'],
        lng: json['lng'],
        logo: MunicipiumImage.fromJson(json['logo']),
        background: MunicipiumImage.fromJson(
            json['background']), // Deserializza l'oggetto MunicipiumImage
        subdomain: json['subdomain'],
        appServiceOne: json['appServiceOne'],
        appServiceTwo: json['appServiceTwo'],
        appServiceThree: json['appServiceThree'],
        appServiceFour: json['appServiceFour'],
        newMenu: NewMenuDTO.fromJson(json['new_menu']),
        jcityGovEnte: json['jcityGovEnte'],
        jcityGovUrl: json['jcityGovUrl']);
  }
}
