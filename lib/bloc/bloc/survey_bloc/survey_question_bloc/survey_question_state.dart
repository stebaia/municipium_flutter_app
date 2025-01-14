part of 'survey_question_bloc.dart';

abstract class SurveyQuestionState extends Equatable {
  const SurveyQuestionState();

  @override
  List<Object> get props => [];
}

class FetchingSurveyQuestionState extends SurveyQuestionState {
  const FetchingSurveyQuestionState();
}

class FetchedSurveyQuestionState extends SurveyQuestionState {
  final QuestionResponse questionResponse;
  const FetchedSurveyQuestionState(this.questionResponse);

  @override
  List<Object> get props => [questionResponse];
}

class NoSurveyQuestionState extends SurveyQuestionState {
  const NoSurveyQuestionState();
}

class ErrorSurveyQuestionState extends SurveyQuestionState {
  const ErrorSurveyQuestionState();
}
