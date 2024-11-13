import 'package:municipium/model/ecoattivi/ecoattivi_answer.dart';

class EcoattiviQuestion {
  int? domandaId;
  String? testo;
  int? progressivo;
  String? spiegazione;
  List<EcoattiviAnswer>? risposte;

  EcoattiviQuestion({
    this.domandaId,
    this.testo,
    this.progressivo,
    this.spiegazione,
    this.risposte,
  });
}
