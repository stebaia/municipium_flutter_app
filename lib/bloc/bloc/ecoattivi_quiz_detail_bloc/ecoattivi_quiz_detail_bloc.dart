import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz_detail.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

part 'ecoattivi_quiz_detail_event.dart';
part 'ecoattivi_quiz_detail_state.dart';

class EcoattiviQuizDetailBloc
    extends Bloc<EcoattiviQuizDetailEvent, EcoattiviQuizDetailState> {
  final EcoattiviRepository ecoattiviRepository;
  EcoattiviQuizDetailBloc({required this.ecoattiviRepository})
      : super(FetchingEcoattiviQuizDetailState()) {
    on<FetchEcoattiviQuizDetailEvent>(_fetchQuizDetail);
  }

  void fetchQuizDetail(String baseUrl, int quizId, String guid, String token) =>
      add(FetchEcoattiviQuizDetailEvent(
          baseUrl: baseUrl, quizId: quizId, guid: guid, token: token));

  FutureOr<void> _fetchQuizDetail(
      FetchEcoattiviQuizDetailEvent fetchEcoattiviQuizDetailEvent,
      Emitter<EcoattiviQuizDetailState> emit) async {
    emit(const FetchingEcoattiviQuizDetailState());
    try {
      final quizDetail = await ecoattiviRepository.getQuizDetail(
          baseUrl: fetchEcoattiviQuizDetailEvent.baseUrl,
          token: fetchEcoattiviQuizDetailEvent.token,
          guid: fetchEcoattiviQuizDetailEvent.guid,
          quizId: fetchEcoattiviQuizDetailEvent.quizId);
      if (quizDetail != null) {
        emit(FetchedEcoattiviQuizDetailState(quizDetail));
      } else {
        emit(const NoEcoattiviQuizDetailState());
      }
    } catch (error) {
      emit(const ErrorEcoattiviQuizDetailState());
    }
  }
}
