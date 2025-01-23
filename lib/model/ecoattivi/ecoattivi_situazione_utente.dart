import 'package:municipium/model/ecoattivi/ecoattivi_azione.dart';

class EcoattiviSituazioneUtente {
  String? codiceAmico;
  int? msgNonLetti;
  int? livelloUtente;
  int? saldoPunti;
  int? puntiInvitaAmico;
  int? quizDaFare;
  int? missioniDaFare;
  List<EcoattiviAzione>? azioni;

  EcoattiviSituazioneUtente({
    this.codiceAmico,
    this.msgNonLetti,
    this.livelloUtente,
    this.saldoPunti,
    this.puntiInvitaAmico,
    this.quizDaFare,
    this.missioniDaFare,
    this.azioni,
  });

  factory EcoattiviSituazioneUtente.fromJson(Map<String, dynamic> json) {
    return EcoattiviSituazioneUtente(
      codiceAmico: json['codiceAmico'] as String?,
      msgNonLetti: json['msgNonLetti'] as int?,
      livelloUtente: json['livelloUtente'] as int?,
      saldoPunti: json['saldoPunti'] as int?,
      puntiInvitaAmico: json['puntiInvitaAmico'] as int?,
      quizDaFare: json['quizDaFare'] as int?,
      missioniDaFare: json['missioniDaFare'] as int?,
      azioni: (json['azioni'] as List<dynamic>?)
          ?.map((e) => EcoattiviAzione.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // To JSON
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
