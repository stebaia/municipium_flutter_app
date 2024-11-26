import 'package:municipium/services/network/dto/ecoattivi_azione_dto.dart';
import 'package:pine/dto/dto.dart';

class EcoattiviSituazioneUtenteDto extends DTO {
  String? codiceAmico;
  int? msgNonLetti;
  int? livelloUtente;
  int? saldoPunti;
  int? puntiInvitaAmico;
  int? quizDaFare;
  int? missioniDaFare;
  List<EcoattiviAzioneDto>? azioni;

  EcoattiviSituazioneUtenteDto({
    this.codiceAmico,
    this.msgNonLetti,
    this.livelloUtente,
    this.saldoPunti,
    this.puntiInvitaAmico,
    this.quizDaFare,
    this.missioniDaFare,
    this.azioni,
  });

  // Metodo per deserializzare da un Map (JSON)
  factory EcoattiviSituazioneUtenteDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviSituazioneUtenteDto(
      codiceAmico: json['codiceAmico'] as String?,
      msgNonLetti: json['msgNonLetti'] as int?,
      livelloUtente: json['livelloUtente'] as int?,
      saldoPunti: json['saldoPunti'] as int?,
      puntiInvitaAmico: json['puntiInvitaAmico'] as int?,
      quizDaFare: json['quizDaFare'] as int?,
      missioniDaFare: json['missioniDaFare'] as int?,
      azioni: (json['azioni'] as List<dynamic>?)
          ?.map((e) => EcoattiviAzioneDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // Metodo per serializzare in Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'codiceAmico': codiceAmico,
      'msgNonLetti': msgNonLetti,
      'livelloUtente': livelloUtente,
      'saldoPunti': saldoPunti,
      'puntiInvitaAmico': puntiInvitaAmico,
      'quizDaFare': quizDaFare,
      'missioniDaFare': missioniDaFare,
      'azioni': azioni?.map((e) => e.toJson()).toList(),
    };
  }
}
