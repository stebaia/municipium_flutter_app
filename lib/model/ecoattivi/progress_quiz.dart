import 'package:flutter/material.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_user_answer.dart';

class ProgressQuiz {
  int? currentQuestion;
  int? totQuestions;
  int? currentPoints;
  int? totalPoints;
  List<EcoattiviUserAnswer>? risposteUtente;
  Map<int, Map<int, Color>>? questionButtonColors; // Mappa dei colori

  ProgressQuiz({
    this.currentQuestion,
    this.totQuestions,
    this.currentPoints,
    this.totalPoints,
    this.risposteUtente,
    Map<int, Map<int, Color>>? questionButtonColors,
  }) : questionButtonColors = questionButtonColors ?? {};

  // copyWith aggiornato
  ProgressQuiz copyWith({
    int? currentQuestion,
    int? totQuestions,
    int? currentPoints,
    int? totalPoints,
    List<EcoattiviUserAnswer>? risposteUtente,
    Map<int, Map<int, Color>>? questionButtonColors,
  }) {
    return ProgressQuiz(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      totQuestions: totQuestions ?? this.totQuestions,
      currentPoints: currentPoints ?? this.currentPoints,
      totalPoints: totalPoints ?? this.totalPoints,
      risposteUtente: risposteUtente ?? this.risposteUtente,
      questionButtonColors: questionButtonColors != null
          ? Map<int, Map<int, Color>>.from(questionButtonColors)
          : this.questionButtonColors,
    );
  }
}
