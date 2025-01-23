class EcoattiviQuiz {
  int? quizId;
  String? desc;
  String? titolo;
  String? descPlain;
  int? numTotDomande;
  int? puntiMax;
  int? statoId;
  int? risposte;
  int? giuste;
  int? puntiGuadagnati;

  EcoattiviQuiz({
    this.quizId,
    this.desc,
    this.titolo,
    this.descPlain,
    this.numTotDomande,
    this.puntiMax,
    this.statoId,
    this.risposte,
    this.giuste,
    this.puntiGuadagnati,
  });

  factory EcoattiviQuiz.fromJson(Map<String, dynamic> json) {
    return EcoattiviQuiz(
      quizId: json['quizId'] as int?,
      desc: json['desc'] as String?,
      titolo: json['titolo'] as String?,
      descPlain: json['descPlain'] as String?,
      numTotDomande: json['numTotDomande'] as int?,
      puntiMax: json['puntiMax'] as int?,
      statoId: json['statoId'] as int?,
      risposte: json['risposte'] as int?,
      giuste: json['giuste'] as int?,
      puntiGuadagnati: json['puntiGuadagnati'] as int?,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'desc': desc,
      'titolo': titolo,
      'descPlain': descPlain,
      'numTotDomande': numTotDomande,
      'puntiMax': puntiMax,
      'statoId': statoId,
      'risposte': risposte,
      'giuste': giuste,
      'puntiGuadagnati': puntiGuadagnati,
    };
  }
}
