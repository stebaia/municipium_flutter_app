import 'dart:convert';

import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:pine/pine.dart';

class MunicipalitySecureMapper extends Mapper<Municipality, String> {
  @override
  String from(Municipality from) => jsonEncode(<String, dynamic>{
        'name': from.municipalityName,
        'id': from.muninicipalityId,
        'subdomain': from.subdomain,
        'logo': from.logo.toJson(),
        'background': from.background.toJson(),
        'new_menu':
            from.new_menu.toJson() // Serializza l'oggetto MunicipiumImage
      });

  @override
  Municipality to(String to) {
    final json = jsonDecode(to);
    return Municipality(
        municipalityName: json['name'],
        muninicipalityId: json['id'],
        logo: MunicipiumImage.fromJson(json['logo']),
        background: MunicipiumImage.fromJson(
            json['background']), // Deserializza l'oggetto MunicipiumImage
        subdomain: json['subdomain'],
        new_menu: json['new_menu']);
  }
}
