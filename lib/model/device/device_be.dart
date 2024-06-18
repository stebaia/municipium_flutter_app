
class DeviceBe {
  String? playerId;
  final String authToken;
  final String token;
  final String platform;
  final String appVersion;
  String udid;
  final String language;

  DeviceBe({required this.playerId, required this.authToken, required this.token, required this.platform, required this.appVersion, required this.udid, required this.language});

  Map<String, dynamic> toJson() {
    return {
      'playerId': playerId,
      'authToken': authToken,
      'token': token,
      'appPlatform': platform,
      'appVersion': appVersion,
      'udid': udid,
      'language': language,
    };
  }

  // Metodo fromJson
  factory DeviceBe.fromJson(Map<String, dynamic> json) {
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