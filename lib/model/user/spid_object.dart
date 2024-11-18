class SpidObject {
  final String municipalityId;
  final String idp;
  final String backUrl;
  final String authSystem;
  final String udid;
  final String playerId;
  final String name;

  SpidObject({
    required this.municipalityId,
    required this.idp,
    required this.backUrl,
    required this.authSystem,
    required this.name,
    required this.playerId,
    required this.udid
  });

  static String getWebSpidUrl(String municipalityId, String idp, String playerId, String udid, String name) {
    String backUrl = 'http://webservice.municipiumapp.it/paypal/success';
    String authSystem = 'spid';
    SpidObject spidObject = SpidObject(municipalityId: municipalityId, idp: idp, backUrl: backUrl, authSystem: authSystem, name: name, playerId: playerId, udid: udid);
    return getRedirectUrl(spidObject);
  }

  static String getRedirectUrl(SpidObject obj) {
  String ep = "login?municipality=${obj.municipalityId}&idp=${obj.idp}&authSystem=${obj.authSystem}&backUrl=${obj.backUrl}&udid=${obj.udid}&playerId=${obj.playerId}&municipalityId=${obj.municipalityId}";   
  String url = "https://mmc.maggiolicloud.it/$ep";
  //Log.debug("DEBUG_PLAYERID:", "PLAYER ID: ${obj.playerId}");
  return url;
}
}