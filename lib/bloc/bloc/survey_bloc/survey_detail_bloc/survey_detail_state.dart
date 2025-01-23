part of 'survey_detail_bloc.dart';

abstract class SurveyDetailState extends Equatable {
  const SurveyDetailState();

  @override
  List<Object> get props => [];
}

class FetchingSurveyDetailState extends SurveyDetailState {
  const FetchingSurveyDetailState();
}

class FetchedSurveyDetailState extends SurveyDetailState {
  final SurveyResponse surveyDetail;
  const FetchedSurveyDetailState(this.surveyDetail);

  @override
  List<Object> get props => [surveyDetail];
}

class ErrorSurveyDetailState extends SurveyDetailState {
  const ErrorSurveyDetailState();
}