import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/survey/question_response.dart';
import 'package:municipium/repositories/survey_repository.dart';

part 'survey_question_event.dart';
part 'survey_question_state.dart';

class SurveyQuestionBloc extends Bloc<SurveyQuestionEvent, SurveyQuestionState> {
  final SurveyRepository surveyRepository;

  SurveyQuestionBloc({required this.surveyRepository})
      : super(const FetchingSurveyQuestionState()) {
    on<FetchSurveyQuestionEvent>(_fetchSurveyQuestions);
  }

  void fetchSurveyQuestions(String baseUrl, int id) =>
      add(FetchSurveyQuestionEvent(baseUrl, id));

  FutureOr<void> _fetchSurveyQuestions(
      FetchSurveyQuestionEvent event, Emitter<SurveyQuestionState> emit) async {
    emit(const FetchingSurveyQuestionState());
    try {
      final response = await surveyRepository.getSurveyQuestions(event.baseUrl, event.id);
      if (response != null) {
        emit(FetchedSurveyQuestionState(response));
      } else {
        emit(const NoSurveyQuestionState());
      }
    } catch (e) {
      emit(const ErrorSurveyQuestionState());
    }
  }
}