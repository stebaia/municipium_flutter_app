import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/survey/survey_response.dart';
import 'package:municipium/repositories/survey_repository.dart';

part 'survey_detail_event.dart';
part 'survey_detail_state.dart';

class SurveyDetailBloc extends Bloc<SurveyDetailEvent, SurveyDetailState> {
  final SurveyRepository surveyRepository;

  SurveyDetailBloc({required this.surveyRepository})
      : super(const FetchingSurveyDetailState()) {
    on<FetchSurveyDetailEvent>(_fetchSurveyDetail);
  }

  void fetchSurveyDetail(String baseUrl, int id) =>
      add(FetchSurveyDetailEvent(baseUrl, id));

  FutureOr<void> _fetchSurveyDetail(
      FetchSurveyDetailEvent event,
      Emitter<SurveyDetailState> emit) async {
    emit(const FetchingSurveyDetailState());
    try {
      final surveyDetail = await surveyRepository
          .getSurveyDetail(event.baseUrl, event.id);
      emit(FetchedSurveyDetailState(surveyDetail));
    } catch (error) {
      emit(const ErrorSurveyDetailState());
    }
  }
}