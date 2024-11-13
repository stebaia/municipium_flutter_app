import 'package:pine/dto/dto.dart'; // Assicurati di avere il DTO di RankingComune importato

class EcoattiviRankingDto extends DTO {
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
  List<EcoattiviRankingComuneDto>? comuni;

  EcoattiviRankingDto({
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

  factory EcoattiviRankingDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviRankingDto(
      resultCode: json['resultCode'],
      errorMessage: json['errorMessage'],
      classificaNazionale: json['classificaNazionale'],
      numIscrittiTotali: json['numIscrittiTotali'],
      puntiProssimoNazionale: json['puntiProssimoNazionale'],
      posizioneProssimoNazionale: json['posizioneProssimoNazionale'],
      classificaLocale: json['classificaLocale'],
      numIscrittiComune: json['numIscrittiComune'],
      puntiProssimoLocale: json['puntiProssimoLocale'],
      posizioneProssimoLocale: json['posizioneProssimoLocale'],
      numComuni: json['numComuni'],
      comuni: (json['comuni'] as List?)
          ?.map((item) => EcoattiviRankingComuneDto.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resultCode': resultCode,
      'errorMessage': errorMessage,
      'classificaNazionale': classificaNazionale,
      'numIscrittiTotali': numIscrittiTotali,
      'puntiProssimoNazionale': puntiProssimoNazionale,
      'posizioneProssimoNazionale': posizioneProssimoNazionale,
      'classificaLocale': classificaLocale,
      'numIscrittiComune': numIscrittiComune,
      'puntiProssimoLocale': puntiProssimoLocale,
      'posizioneProssimoLocale': posizioneProssimoLocale,
      'numComuni': numComuni,
      'comuni': comuni?.map((e) => e.toJson()).toList(),
    };
  }
}

class EcoattiviRankingComuneDto extends DTO {
  int? ranking;
  String? nomeComune;
  bool? comuneUtente;

  // Costruttore
  EcoattiviRankingComuneDto({this.ranking, this.nomeComune, this.comuneUtente});

  // Metodo per la deserializzazione da JSON
  factory EcoattiviRankingComuneDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviRankingComuneDto(
      ranking: json['ranking'] as int?,
      nomeComune: json['nomeComune'] as String?,
      comuneUtente: json['comuneUtente'] as bool?,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'ranking': ranking,
      'nomeComune': nomeComune,
      'comuneUtente': comuneUtente,
    };
  }
}
