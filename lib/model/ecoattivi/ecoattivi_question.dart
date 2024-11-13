import 'package:municipium/model/ecoattivi/ecoattivi_answer.dart';

class EcoattiviQuestion {
  int? domandaId;
  String? tsto;
  int? progressivo;
  String? spiegazione;
  List<EcoattiviAnswer>? risposte;

  EcoattiviQuestion({
    this.domandaId,
    this.tsto,
    this.progressivo,
    this.spiegazione,
    this.risposte,
  });
}
