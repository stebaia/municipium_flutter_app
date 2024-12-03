import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

part 'ecoattivi_quiz_event.dart';
part 'ecoattivi_quiz_state.dart';

class EcoattiviQuizBloc extends Bloc<EcoattiviQuizEvent, EcoattiviQuizState> {
  final EcoattiviRepository ecoattiviRepository;

  EcoattiviQuizBloc({required this.ecoattiviRepository})
      : super(FetchingEcoattiviQuizListState()) {
    on<FetchEcoattiviQuizEvent>(_fetchQuizList);
  }

  void fetchQuizList(String baseUrl, String token, String guid) =>
      add(FetchEcoattiviQuizEvent(baseUrl: baseUrl, token: token, guid: guid));

  FutureOr<void> _fetchQuizList(FetchEcoattiviQuizEvent fetchEcoattiviQuizEvent,
      Emitter<EcoattiviQuizState> emit) async {
    emit(const FetchingEcoattiviQuizListState());
    try {
      final quizList = await ecoattiviRepository.getQuizList(
          fetchEcoattiviQuizEvent.baseUrl,
          fetchEcoattiviQuizEvent.token,
          fetchEcoattiviQuizEvent.guid);
      if (quizList.isNotEmpty) {
        emit(FetchedEcoattiviQuizListState(quizList));
      } else {
        emit(const NoEcoattiviQuizListState());
      }
    } catch (error) {
      emit(const ErrorEcoattiviQuizListState());
    }
  }
}
