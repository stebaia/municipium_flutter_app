part of 'survey_question_bloc.dart';

abstract class SurveyQuestionEvent extends Equatable {
  const SurveyQuestionEvent();

  @override
  List<Object> get props => [];
}

class FetchSurveyQuestionEvent extends SurveyQuestionEvent {
  final String baseUrl;
  final int id;
  const FetchSurveyQuestionEvent(this.baseUrl, this.id);

  @override
  List<Object> get props => [baseUrl, id];
}
