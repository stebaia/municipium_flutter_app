import 'dart:convert';

import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
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
        'zip_code': from.zipCode ?? '',
        'prefix': from.prefix ?? '',
        'surface': from.surface ?? '',
        'citizens_number': from.citizensNumber ?? 0,
        'description': from.description ?? '',
        'image' : from.image ?? from.image!.toJson(),
        'logo': from.logo ?? from.logo!.toJson(),
        'background': from.background ?? from.background!.toJson(),
        'appServiceOne': from.appServiceOne,
        'appServiceTwo': from.appServiceTwo,
        'appServiceThree': from.appServiceThree,
        'appServiceFour': from.appServiceFour,
        'province': from.province,
        'new_menu': from.newMenu.toJson(),
        'configurations': from.configurations ?? from.configurations!.toJson(),
        'url_prenotazioni_web':
            from.prenotationWebUrl, // Serializza l'oggetto MunicipiumImage
        'civil_defence_type': from.civilDefenceType
      });

  @override
  Municipality to(String to) {
    final json = jsonDecode(to);
    return Municipality(
        codiceSap: json['codice_sap'] ?? '',
        municipalityName: json['name'],
        muninicipalityId: json['id'],
        lat: json['lat'],
        lng: json['lng'],
        zipCode: json['zip_code'] ?? '',
        prefix: json['prefix'] ?? '',
        surface: json['surface'] ?? '',
        citizensNumber: json['citizens_number'] ?? 0,
        description: json['description'] ?? '',
        image: json['image'] != null ? MunicipiumImage.fromJson(json['image']) : null,
        logo: MunicipiumImage.fromJson(json['logo']),
        background: MunicipiumImage.fromJson(
            json['background']), // Deserializza l'oggetto MunicipiumImage
        subdomain: json['subdomain'],
        appServiceOne: json['appServiceOne'],
        appServiceTwo: json['appServiceTwo'],
        appServiceThree: json['appServiceThree'],
        appServiceFour: json['appServiceFour'],
        province: json['province'],
        newMenu: NewMenuDTO.fromJson(
          json['new_menu'],
        ),
        configurations: Configurations.fromJson(json['configurations']),
        jcityGovEnte: json['jcityGovEnte'] ?? '',
        civilDefenceType: json['civil_defence_type'] ?? '',
        civilDefenceNewsCategoryIds: json['civil_defence_news_category_ids'] ?? [],
        prenotationWebUrl: json['url_prenotazioni_web'] ?? '',
        jcityGovUrl: json['jcityGovUrl'] ?? '',
        istat: json['istat'] ?? -1);
  }
}
