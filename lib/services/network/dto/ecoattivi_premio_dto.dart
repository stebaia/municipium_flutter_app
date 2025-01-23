import 'package:pine/dto/dto.dart';

class EcoattiviPremioResult {
  int? resultCode;
  String? errorMessage;
  List<EcoattiviPremioDto>? riscatti;

  EcoattiviPremioResult({this.resultCode, this.errorMessage, this.riscatti});

  EcoattiviPremioResult.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    errorMessage = json['errorMessage'];
    if (json['riscatti'] != null) {
      riscatti = <EcoattiviPremioDto>[];
      json['riscatti'].forEach((v) {
        riscatti!.add(new EcoattiviPremioDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    data['errorMessage'] = this.errorMessage;
    if (this.riscatti != null) {
      data['riscatti'] = this.riscatti!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EcoattiviRequisitoDto extends DTO {
  int? requisitoId;
  String? requisitoDesc;
  String? requisitoInfoHtml;
  int? tipo;
  List<String>? opzioni;
  bool? obbligatorio;
  String? valore;

  // Costruttore
  EcoattiviRequisitoDto({
    this.requisitoId,
    this.requisitoDesc,
    this.requisitoInfoHtml,
    this.tipo,
    this.opzioni,
    this.obbligatorio,
    this.valore,
  });

  // Metodo per la deserializzazione da JSON
  factory EcoattiviRequisitoDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviRequisitoDto(
      requisitoId: json['requisitoId'] as int?,
      requisitoDesc: json['requisitoDesc'] as String?,
      requisitoInfoHtml: json['requisitoInfoHtml'] as String?,
      tipo: json['tipo'] as int?,
      opzioni:
          (json['opzioni'] as List?)?.map((item) => item as String).toList(),
      obbligatorio: json['obbligatorio'] as bool?,
      valore: json['valore'] as String?,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'requisitoId': requisitoId,
      'requisitoDesc': requisitoDesc,
      'requisitoInfoHtml': requisitoInfoHtml,
      'tipo': tipo,
      'opzioni': opzioni,
      'obbligatorio': obbligatorio,
      'valore': valore,
    };
  }
}

class EcoattiviPremioDto extends DTO {
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
  List<EcoattiviRequisitoDto>? requisito;

  // Costruttore
  EcoattiviPremioDto({
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

  // Metodo per la deserializzazione da JSON
  factory EcoattiviPremioDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviPremioDto(
      riscattoId: json['riscattoId'] as int?,
      dataInizio: json['dataInizio'] as String?,
      dataFine: json['dataFine'] as String?,
      titolo: json['titolo'] as String?,
      iscrizioneAbilitata: json['iscrizioneAbilitata'] as bool?,
      premioSingolare: json['premioSingolare'] as String?,
      premioPlurale: json['premioPlurale'] as String?,
      conversione: json['conversione'] as int?,
      conversionePeriodica: json['conversionePeriodica'] as bool?,
      saldoPremi: json['saldoPremi'] as int?,
      urlBanner: json['urlBanner'] as String?,
      descHtml: json['descHtml'] as String?,
      descTxt: json['descTxt'] as String?,
      schedaUtentiIscritti: json['schedaUtentiIscritti'] as String?,
      regolamento: json['regolamento'] as String?,
      statoUtenteCausale: json['statoUtenteCausale'] as String?,
      dedicato: json['dedicato'] as bool?,
      numPuntiConvertibili: json['numPuntiConvertibili'] as int?,
      descPuntiConvertibili: json['descPuntiConvertibili'] as String?,
      statoPremiPrincipale: json['statoPremiPrincipale'] as String?,
      statoPremiSecondario: json['statoPremiSecondario'] as String?,
      dettaglioPremi: json['dettaglioPremi'] as String?,
      statoRiscattoId: json['statoRiscattoId'] as int?,
      statoUtenteId: json['statoUtenteId'] as int?,
      requisito: (json['requisito'] as List?)
          ?.map((item) =>
              EcoattiviRequisitoDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'riscattoId': riscattoId,
      'dataInizio': dataInizio,
      'dataFine': dataFine,
      'titolo': titolo,
      'iscrizioneAbilitata': iscrizioneAbilitata,
      'premioSingolare': premioSingolare,
      'premioPlurale': premioPlurale,
      'conversione': conversione,
      'conversionePeriodica': conversionePeriodica,
      'saldoPremi': saldoPremi,
      'urlBanner': urlBanner,
      'descHtml': descHtml,
      'descTxt': descTxt,
      'schedaUtentiIscritti': schedaUtentiIscritti,
      'regolamento': regolamento,
      'statoUtenteCausale': statoUtenteCausale,
      'dedicato': dedicato,
      'numPuntiConvertibili': numPuntiConvertibili,
      'descPuntiConvertibili': descPuntiConvertibili,
      'statoPremiPrincipale': statoPremiPrincipale,
      'statoPremiSecondario': statoPremiSecondario,
      'dettaglioPremi': dettaglioPremi,
      'statoRiscattoId': statoRiscattoId,
      'statoUtenteId': statoUtenteId,
      'requisito': requisito?.map((e) => e.toJson()).toList(),
    };
  }
}
