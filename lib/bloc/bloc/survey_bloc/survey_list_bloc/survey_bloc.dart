import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/survey/survey.dart';
import 'package:municipium/repositories/survey_repository.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyListBloc extends Bloc<SurveyListEvent, SurveyListState> {
  final SurveyRepository surveyRepository;

  SurveyListBloc({required this.surveyRepository})
      : super(SurveyListState.initial()) {
    on<FetchSurveyActiveListEvent>(_fetchSurveyList);
    on<FetchSurveyArchivedListEvent>(_fetchSurveyArchivedList);
  }

  void fetchSurveyList(String baseUrl, String type, String udid) =>
      add(FetchSurveyActiveListEvent(baseUrl, type, udid));

  void fetchSurveyArchivedList(String baseUrl, String type, String udid) =>
      add(FetchSurveyArchivedListEvent(baseUrl, type, udid));

  FutureOr<void> _fetchSurveyList(
      FetchSurveyActiveListEvent event,
      Emitter<SurveyListState> emit) async {
    emit(state.copyWith(activeSurveysStatus: SurveyStatus.loading));
    try {
      final surveyList = await surveyRepository
          .getSurveyList(event.baseUrl, event.type, event.udid);
      
      if (surveyList.isNotEmpty) {
        emit(state.copyWith(
          activeSurveysStatus: SurveyStatus.loaded,
          activeSurveys: surveyList,
        ));
      } else {
        emit(state.copyWith(activeSurveysStatus: SurveyStatus.empty));
      }
    } catch (error) {
      emit(state.copyWith(activeSurveysStatus: SurveyStatus.error));
    }
  }

  FutureOr<void> _fetchSurveyArchivedList(
      FetchSurveyArchivedListEvent event,
      Emitter<SurveyListState> emit) async {
    emit(state.copyWith(archivedSurveysStatus: SurveyStatus.loading));
    try {
      final surveyList = await surveyRepository
          .getSurveyList(event.baseUrl, event.type, event.udid);
      
      if (surveyList.isNotEmpty) {
        emit(state.copyWith(
          archivedSurveysStatus: SurveyStatus.loaded,
          archivedSurveys: surveyList,
        ));
      } else {
        emit(state.copyWith(archivedSurveysStatus: SurveyStatus.empty));
      }
    } catch (error) {
      emit(state.copyWith(archivedSurveysStatus: SurveyStatus.error));
    }
  }
}