import 'package:municipium/model/ecoattivi/ecoattivi_requisito.dart';

class EcoattiviPremio {
  int? riscattoId;
  String? dataInizio;
  String? dataFine;
  String? titolo;
  bool? iscrizioneAbilitata;
  String? premioSingolare;
  String? premioPlurale;
  int? conversione;
  bool? conversionePeriodica;
  int? saldoPremi;
  String? urlBanner;
  String? descHtml;
  String? descTxt;
  String? schedaUtentiIscritti;
  String? regolamento;
  String? statoUtenteCausale;
  bool? dedicato;
  int? numPuntiConvertibili;
  String? descPuntiConvertibili;
  String? statoPremiPrincipale;
  String? statoPremiSecondario;
  String? dettaglioPremi;
  int? statoRiscattoId;
  int? statoUtenteId;
  List<EcoattiviRequisito>? requisito;

  // Costruttore
  EcoattiviPremio({
    this.riscattoId,
    this.dataInizio,
    this.dataFine,
    this.titolo,
    this.iscrizioneAbilitata,
    this.premioSingolare,
    this.premioPlurale,
    this.conversione,
    this.conversionePeriodica,
    this.saldoPremi,
    this.urlBanner,
    this.descHtml,
    this.descTxt,
    this.schedaUtentiIscritti,
    this.regolamento,
    this.statoUtenteCausale,
    this.dedicato,
    this.numPuntiConvertibili,
    this.descPuntiConvertibili,
    this.statoPremiPrincipale,
    this.statoPremiSecondario,
    this.dettaglioPremi,
    this.statoRiscattoId,
    this.statoUtenteId,
    this.requisito,
  });
}
