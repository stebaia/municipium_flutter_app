import 'package:pine/dto/dto.dart';

import 'package:pine/dto/dto.dart';

class EcoattiviQuizDetailReponse {
  int? resultCode;
  String? errorMessage;
  EcoattiviQuizDetailDto? quiz;

  EcoattiviQuizDetailReponse({this.resultCode, this.errorMessage, this.quiz});

  EcoattiviQuizDetailReponse.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    errorMessage = json['errorMessage'];
    quiz = json['quiz'] != null
        ? new EcoattiviQuizDetailDto.fromJson(json['quiz'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    data['errorMessage'] = this.errorMessage;
    if (this.quiz != null) {
      data['quiz'] = this.quiz!.toJson();
    }
    return data;
  }
}

class EcoattiviQuizDetailDto extends DTO {
  int? quizId;
  int? puntiDomanda;
  int? tipoId;
  List<EcoattiviQuestionDto>? domande;
  List<EcoattiviUserAnswerDto>? risposteUtente;

  EcoattiviQuizDetailDto({
    this.quizId,
    this.puntiDomanda,
    this.tipoId,
    this.domande,
    this.risposteUtente,
  });

  factory EcoattiviQuizDetailDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviQuizDetailDto(
      quizId: json['quizId'],
      puntiDomanda: json['puntiDomanda'],
      tipoId: json['tipoId'],
      domande: (json['domande'] as List?)
              ?.map((item) => EcoattiviQuestionDto.fromJson(item))
              .toList() ??
          [],
      risposteUtente: (json['risposteUtente'] as List?)
              ?.map((item) => EcoattiviUserAnswerDto.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'puntiDomanda': puntiDomanda,
      'domande': domande?.map((e) => e.toJson()).toList(),
      'risposteUtente': risposteUtente?.map((e) => e.toJson()).toList(),
    };
  }
}

class EcoattiviQuestionDto extends DTO {
  int? domandaId;
  String? testo;
  int? progressivo;
  //String? spiegazione;
  List<EcoattiviAnswerDto>? risposte;

  EcoattiviQuestionDto({
    this.domandaId,
    this.testo,
    this.progressivo,
    //this.spiegazione,
    this.risposte,
  });

  factory EcoattiviQuestionDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviQuestionDto(
      domandaId: json['domandaId'],
      testo: json['testo'],
      progressivo: json['progressivo'],
      //spiegazione: json['spiegazione'],
      risposte: (json['risposte'] as List<dynamic>?)
          ?.map((e) => EcoattiviAnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'domandaId': domandaId,
      'testo': testo,
      'progressivo': progressivo,
      //'spiegazione': spiegazione,
      'risposte': risposte?.map((e) => e.toJson()).toList(),
    };
  }
}

class EcoattiviAnswerDto extends DTO {
  int? rispostaId;
  String? testo;
  int? progressivo;
  bool? rispostaEsatta;

  EcoattiviAnswerDto({
    this.rispostaId,
    this.testo,
    this.progressivo,
    this.rispostaEsatta,
  });

  // Metodo per convertire l'oggetto in una mappa per JSON encoding
  Map<String, dynamic> toJson() => {
        'rispostaId': rispostaId,
        'testo': testo,
        'progressivo': progressivo,
        'rispostaEsatta': rispostaEsatta,
      };

  // Metodo per creare l'oggetto dal JSON
  factory EcoattiviAnswerDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviAnswerDto(
      rispostaId: json['rispostaId'] as int?,
      testo: json['testo'] as String?,
      progressivo: json['progressivo'] as int?,
      rispostaEsatta: json['rispostaEsatta'] as bool?,
    );
  }
}

class EcoattiviUserAnswerDto extends DTO {
  int? domandaId;
  int? rispostaId;

  EcoattiviUserAnswerDto({
    this.domandaId,
    this.rispostaId,
  });

  factory EcoattiviUserAnswerDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviUserAnswerDto(
      domandaId: json['domandaId'],
      rispostaId: json['rispostaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'domandaId': domandaId,
      'rispostaId': rispostaId,
    };
  }
}
