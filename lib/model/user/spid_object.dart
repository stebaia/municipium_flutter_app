class SpidObject {
  final String codiceSap;
  final String municipalityId;
  final String idp;
  final String backUrl;
  final String authSystem;
  final String udid;
  final String playerId;
  final String name;

  SpidObject(
      {required this.codiceSap,
      required this.municipalityId,
      required this.idp,
      required this.backUrl,
      required this.authSystem,
      required this.name,
      required this.playerId,
      required this.udid});

  static String getWebSpidUrl(
      String baseUrl,
      String codiceSap,
      String municipalityId,
      String idp,
      String playerId,
      String udid,
      String name) {
    String backUrl = 'http://webservice.municipiumapp.it/paypal/success';
    String authSystem = 'spid';
    SpidObject spidObject = SpidObject(
        codiceSap: codiceSap,
        municipalityId: municipalityId,
        idp: idp,
        backUrl: backUrl,
        authSystem: authSystem,
        name: name,
        playerId: playerId,
        udid: udid);
    return getRedirectUrl(baseUrl, spidObject);
  }

  static String getRedirectUrl(String baseUrl, SpidObject obj) {
    String ep =
        "login?municipality=${obj.codiceSap}&idp=${obj.idp}&authSystem=${obj.authSystem}&backUrl=${obj.backUrl}&udid=${obj.udid}&playerId=${obj.playerId}&municipalityId=${obj.municipalityId}";
    String url = "${baseUrl}/$ep";
    //Log.debug("DEBUG_PLAYERID:", "PLAYER ID: ${obj.playerId}");
    return url;
  }
}
