import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/ecoattivi/aggiorna_quiz_body.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_user_answer.dart';
import 'package:municipium/model/ecoattivi/progress_quiz.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

class EcoattiviPagerCubit extends Cubit<ProgressQuiz> {
  final EcoattiviRepository ecoattiviRepository;

  EcoattiviPagerCubit({required this.ecoattiviRepository})
      : super(ProgressQuiz());

  void setCurrentQuestion(int currentQuestion) {
    final updatedQuiz = state.copyWith(currentQuestion: currentQuestion);
    emit(updatedQuiz);
  }

  void setTotQuestions(int totQuestions) {
    final updatedQuiz = state.copyWith(totQuestions: totQuestions);
    emit(updatedQuiz);
  }

  void setCurrentPoints(int currentPoints) {
    final updatedQuiz = state.copyWith(currentPoints: currentPoints);
    emit(updatedQuiz);
  }

  void setTotalPoints(int totalPoints) {
    final updatedQuiz = state.copyWith(totalPoints: totalPoints);
    emit(updatedQuiz);
  }

  void addRispostaUtente(EcoattiviUserAnswer answer) {
    (state.risposteUtente ??= []).add(answer);
    List<EcoattiviUserAnswer> list = state.risposteUtente!;
    final updatedQuiz = state.copyWith(risposteUtente: list);
    emit(updatedQuiz);
  }

  void addRisposteUtente(List<EcoattiviUserAnswer> answers) {
    (state.risposteUtente ??= []).addAll(answers);
    List<EcoattiviUserAnswer> list = state.risposteUtente!;
    final updatedQuiz = state.copyWith(risposteUtente: list);
    emit(updatedQuiz);
  }

  void updateButtonColor(int questionId, int answerId, Color color) {
    // Crea una copia della mappa dei colori
    final updatedColors =
        Map<int, Map<int, Color>>.from(state.questionButtonColors ?? {});

    // Crea una copia della mappa interna per la domanda
    final questionColors = updatedColors[questionId] ?? {};

    // Aggiorna il colore della risposta
    questionColors[answerId] = color;

    // Aggiorna la mappa dei colori per quella domanda
    updatedColors[questionId] = questionColors;

    // Emette un nuovo stato con la mappa aggiornata
    emit(state.copyWith(questionButtonColors: updatedColors));
  }

  FutureOr<bool> updateQuiz(
      String baseUrl, String token, String guid, int? quizId, bool? monetizza,
      {bool? reset}) async {
    AggiornaQuizBody body = AggiornaQuizBody(
        quizId: quizId,
        monetizza:
            (reset ?? false) ? false : monetizza, //se è reset non monetizzo
        risposte: (reset ?? false)
            ? []
            : state.risposteUtente, //se è reset mando lista vuota
        punti: state.currentPoints);
    return await ecoattiviRepository.updateQuiz(
        baseUrl: baseUrl, token: token, guid: guid, body: body);
  }

  Map<int, Color>? getButtonColors(int questionId) {
    return state.questionButtonColors?[questionId] ?? {};
  }
}
