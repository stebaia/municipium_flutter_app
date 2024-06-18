class ResponseDevicePut {
  final String playerId;
  final String udid;

  ResponseDevicePut({required this.playerId, required this.udid});

  Map<String, dynamic> toJson() {
    return {
      'playerId': playerId,
      'udid': udid,
    };
  }

  // Metodo per creare un'istanza di ResponseDevicePut da un JSON
  factory ResponseDevicePut.fromJson(Map<String, dynamic> json) {
    return ResponseDevicePut(
      playerId: json['playerId'],
      udid: json['udid'],
    );
  }

}