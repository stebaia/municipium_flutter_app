import 'dart:convert';

import 'package:municipium/model/device/device_be.dart';
import 'package:pine/pine.dart';

class DeviceSecureMapper extends Mapper<DeviceBe, String> {
  String from(DeviceBe from) => jsonEncode(<String, dynamic>{
        'playerId': from.playerId,
        'authToken': from.authToken,
        'token': from.token,
        'appPlatform': from.platform,
        'appVersion': from.appVersion,
        'udid': from.udid,
        'language': from.language,
      });

  @override
  DeviceBe to(String to) {
    final json = jsonDecode(to);
    return DeviceBe(
      playerId: json['playerId'],
      authToken: json['authToken'],
      token: json['token'],
      platform: json['appPlatform'],
      appVersion: json['appVersion'],
      udid: json['udid'],
      language: json['language'],
    );
  }
}
