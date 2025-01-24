class EcoattiviQrResponse {
  final String? errorMessage;
  final int? resultCode;
  final int? punti;
  final String? titolo;
  final String? indirizzo;
  final String? messaggioSociale;

  EcoattiviQrResponse(
      {required this.errorMessage,
      required this.resultCode,
      required this.punti,
      required this.titolo,
      required this.indirizzo,
      required this.messaggioSociale});

  factory EcoattiviQrResponse.fromJson(Map<String, dynamic> json) {
    return EcoattiviQrResponse(
        errorMessage: json['errorMessage'] as String?,
        titolo: json['titolo'] as String?,
        resultCode: json['resultCode'] as int?,
        punti: json['punti'] as int?,
        indirizzo: json['indirizzo'] as String?,
        messaggioSociale: json['messaggioSociale'] as String?);
  }
}
