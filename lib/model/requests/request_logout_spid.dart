class RequestLogoutSpidId {
  final String playerId;
  final String cf;
  final String udid;

  RequestLogoutSpidId(
      {required this.playerId, required this.cf, required this.udid});

  // Metodo per serializzare in JSON
  Map<String, dynamic> toJson() {
    return {
      'playerId': playerId,
      'cf': cf,
      'udid': udid,
    };
  }

  // Costruttore per deserializzare da JSON
  factory RequestLogoutSpidId.fromJson(Map<String, dynamic> json) {
    return RequestLogoutSpidId(
      playerId: json['playerId'],
      cf: json['cf'],
      udid: json['udid'],
    );
  }
}

class RequestLogoutSpid {
  final RequestLogoutSpidId id;
  RequestLogoutSpid({required this.id});

  // Metodo per serializzare in JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
    };
  }

  // Costruttore per deserializzare da JSON
  factory RequestLogoutSpid.fromJson(Map<String, dynamic> json) {
    return RequestLogoutSpid(
      id: RequestLogoutSpidId.fromJson(json['id']),
    );
  }
}
