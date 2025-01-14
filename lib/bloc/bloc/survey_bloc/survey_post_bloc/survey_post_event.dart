part of 'survey_post_bloc.dart';

abstract class SurveyVoteEvent extends Equatable {
  const SurveyVoteEvent();

  @override
  List<Object> get props => [];
}

class PostSurveyVoteEvent extends SurveyVoteEvent {
  final String baseUrl;
  final int id;
  final SurveyPostRequest surveyPostRequest;
  const PostSurveyVoteEvent(this.baseUrl, this.id, this.surveyPostRequest);

  @override
  List<Object> get props => [baseUrl, id, surveyPostRequest];
}