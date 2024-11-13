import 'package:pine/dto/dto.dart';

class EcostopDto extends DTO {
  int? ecostopId;
  String? titolo;
  String? descHtml;
  String? desctxt;
  String? urlEcoStop;
  String? indirizzo;
  String? comune;
  String? provincia;
  String? regione;
  double? lat; // Assumendo che sia un float come nel modello iOS
  double? lon; // Assumendo che sia un float come nel modello iOS
  int? tipoId;
  String? tipoDesc;
  String? tipoColore;

  // Costruttore
  EcostopDto({
    this.ecostopId,
    this.titolo,
    this.descHtml,
    this.desctxt,
    this.urlEcoStop,
    this.indirizzo,
    this.comune,
    this.provincia,
    this.regione,
    this.lat,
    this.lon,
    this.tipoId,
    this.tipoDesc,
    this.tipoColore,
  });

  // Metodo per la deserializzazione da JSON
  factory EcostopDto.fromJson(Map<String, dynamic> json) {
    return EcostopDto(
      ecostopId: json['ecostopId'] as int?,
      titolo: json['titolo'] as String?,
      descHtml: json['descHtml'] as String?,
      desctxt: json['desctxt'] as String?,
      urlEcoStop: json['urlEcoStop'] as String?,
      indirizzo: json['indirizzo'] as String?,
      comune: json['comune'] as String?,
      provincia: json['provincia'] as String?,
      regione: json['regione'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      tipoId: json['tipoId'] as int?,
      tipoDesc: json['tipoDesc'] as String?,
      tipoColore: json['tipoColore'] as String?,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'ecostopId': ecostopId,
      'titolo': titolo,
      'descHtml': descHtml,
      'desctxt': desctxt,
      'urlEcoStop': urlEcoStop,
      'indirizzo': indirizzo,
      'comune': comune,
      'provincia': provincia,
      'regione': regione,
      'lat': lat,
      'lon': lon,
      'tipoId': tipoId,
      'tipoDesc': tipoDesc,
      'tipoColore': tipoColore,
    };
  }
}
