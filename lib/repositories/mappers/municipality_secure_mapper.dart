import 'dart:convert';

import 'package:municipium/model/municipality.dart';
import 'package:pine/pine.dart';

class MunicipalitySecureMapper extends Mapper<Municipality, String> {
  @override
  String from(Municipality from) => jsonEncode(<String, dynamic>{
        'name': from.municipalityName,
        'id': from.muninicipalityId,
        'subdomain': from.subdomain
      });

  @override
  Municipality to(String to) {
    final json = jsonDecode(to);
    return Municipality(
        municipalityName: json['name'],
        muninicipalityId: json['id'],
        subdomain: json['subdomain']);
  }
}
