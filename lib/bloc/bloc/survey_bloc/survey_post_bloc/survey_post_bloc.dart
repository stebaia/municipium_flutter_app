import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/survey/survey_post_request.dart';
import 'package:municipium/model/survey/survey_post_response.dart';
import 'package:municipium/repositories/survey_repository.dart';

part 'survey_post_event.dart';
part 'survey_post_state.dart';

class SurveyVoteBloc extends Bloc<SurveyVoteEvent, SurveyVoteState> {
  final SurveyRepository surveyRepository;

  SurveyVoteBloc({required this.surveyRepository})
      : super(const PostingSurveyVoteState()) {
    on<PostSurveyVoteEvent>(_postSurveyVote);
  }

  void postSurveyVote(String baseUrl, int id, SurveyPostRequest surveyPostRequest) =>
      add(PostSurveyVoteEvent(baseUrl, id, surveyPostRequest));

  FutureOr<void> _postSurveyVote(
      PostSurveyVoteEvent event, Emitter<SurveyVoteState> emit) async {
    emit(const PostingSurveyVoteState());
    try {
      final response = await surveyRepository.postSurveyVote(
          event.baseUrl, event.id, event.surveyPostRequest);
      emit(PostedSurveyVoteState(response));
    } catch (e) {
      emit(const ErrorSurveyVoteState());
    }
  }
}