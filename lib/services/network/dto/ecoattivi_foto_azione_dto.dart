import 'package:pine/dto/dto.dart';

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
