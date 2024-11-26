import 'package:pine/dto/dto.dart';

class EcoattiviAzioneDto extends DTO {
  int? azioneId;
  String? titolo;
  String? desc;
  int? punti;
  bool? eseguita;

  EcoattiviAzioneDto({
    this.azioneId,
    this.titolo,
    this.desc,
    this.punti,
    this.eseguita,
  });

  // Metodo per deserializzare da un Map (JSON)
  factory EcoattiviAzioneDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviAzioneDto(
      azioneId: json['azioneId'] as int?,
      titolo: json['titolo'] as String?,
      desc: json['desc'] as String?,
      punti: json['punti'] as int?,
      eseguita: json['eseguita'] as bool?,
    );
  }

  // Metodo per serializzare in Map (JSON)
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
