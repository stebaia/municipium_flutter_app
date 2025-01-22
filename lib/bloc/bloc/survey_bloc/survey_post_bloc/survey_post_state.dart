part of 'survey_post_bloc.dart';
abstract class SurveyVoteState extends Equatable {
  const SurveyVoteState();

  @override
  List<Object> get props => [];
}

class PostingSurveyVoteState extends SurveyVoteState {
  const PostingSurveyVoteState();
}

class PostedSurveyVoteState extends SurveyVoteState {
  final SurveyPostResponse surveyPostResponse;
  const PostedSurveyVoteState(this.surveyPostResponse);

  @override
  List<Object> get props => [surveyPostResponse];
}

class ErrorSurveyVoteState extends SurveyVoteState {
  const ErrorSurveyVoteState();
}
