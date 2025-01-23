class EcoattiviUserAnswer {
  int? domandaId;
  int? rispostaId;

  EcoattiviUserAnswer({
    this.domandaId,
    this.rispostaId,
  });

  factory EcoattiviUserAnswer.fromJson(Map<String, dynamic> json) {
    return EcoattiviUserAnswer(
      domandaId: json['domandaId'] as int?,
      rispostaId: json['rispostaId'] as int?,
    );
  }

  // Funzione per convertire in JSON
  Map<String, dynamic> toJson() {
    return {
      'domandaId': domandaId,
      'rispostaId': rispostaId,
    };
  }
}
