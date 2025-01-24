class EcoattiviQrBody {
  final double? lat;
  final double? lon;
  final String? qrCode;

  EcoattiviQrBody({required this.lat, required this.lon, required this.qrCode});

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
      'qrCode': qrCode,
    };
  }
}
