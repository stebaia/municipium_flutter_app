import 'package:municipium/model/ecoattivi/ecoattivi_ranking_comune.dart';

class EcoattiviRanking {
  int? resultCode;
  String? errorMessage;
  int? classificaNazionale;
  int? numIscrittiTotali;
  int? puntiProssimoNazionale;
  int? posizioneProssimoNazionale;
  int? classificaLocale;
  int? numIscrittiComune;
  int? puntiProssimoLocale;
  int? posizioneProssimoLocale;
  int? numComuni;
  List<EcoattiviRankingComune>? comuni;

  EcoattiviRanking({
    this.resultCode,
    this.errorMessage,
    this.classificaNazionale,
    this.numIscrittiTotali,
    this.puntiProssimoNazionale,
    this.posizioneProssimoNazionale,
    this.classificaLocale,
    this.numIscrittiComune,
    this.puntiProssimoLocale,
    this.posizioneProssimoLocale,
    this.numComuni,
    this.comuni,
  });
}
