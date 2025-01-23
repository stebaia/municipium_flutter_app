class IdToSend {
  int? quizId;

  IdToSend({required this.quizId});

  factory IdToSend.fromJson(Map<String, dynamic> json) {
    return IdToSend(
      quizId: json['quizId'] as int?,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
    };
  }
}
