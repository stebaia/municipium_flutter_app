import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';

class EcoattiviWrapper {
  String? token;
  EcoattiviSituazioneUtente? situazioneUtente;

  EcoattiviWrapper({
    this.token,
    this.situazioneUtente,
  });

  // CopyWith
  EcoattiviWrapper copyWith({
    String? token,
    EcoattiviSituazioneUtente? situazioneUtente,
  }) {
    return EcoattiviWrapper(
      token: token ?? this.token,
      situazioneUtente: situazioneUtente ?? this.situazioneUtente,
    );
  }
}
