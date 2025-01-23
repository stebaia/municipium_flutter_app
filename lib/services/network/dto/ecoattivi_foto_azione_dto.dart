import 'package:pine/dto/dto.dart';

class EcoattiviPhotoListReponse {
  int? resultCode;
  Null? errorMessage;
  List<EcoattiviFotoAzioneDto>? azioni;

  EcoattiviPhotoListReponse({this.resultCode, this.errorMessage, this.azioni});

  EcoattiviPhotoListReponse.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    errorMessage = json['errorMessage'];
    if (json['azioni'] != null) {
      azioni = <EcoattiviFotoAzioneDto>[];
      json['azioni'].forEach((v) {
        azioni!.add(new EcoattiviFotoAzioneDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    data['errorMessage'] = this.errorMessage;
    if (this.azioni != null) {
      data['azioni'] = this.azioni!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EcoattiviFotoAzioneDto extends DTO {
  int? azioneId;
  String? titolo;
  String? desc;
  int? punti;
  bool? eseguita;

  // Costruttore
  EcoattiviFotoAzioneDto({
    this.azioneId,
    this.titolo,
    this.desc,
    this.punti,
    this.eseguita,
  });

  // Metodo per la deserializzazione da JSON
  factory EcoattiviFotoAzioneDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviFotoAzioneDto(
      azioneId: json['azioneId'] as int?,
      titolo: json['titolo'] as String?,
      desc: json['desc'] as String?,
      punti: json['punti'] as int?,
      eseguita: json['eseguita'] as bool?,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'azioneId': azioneId,
      'titolo': titolo,
      'desc': desc,
      'punti': punti,
      'eseguita': eseguita,
    };
  }
}
