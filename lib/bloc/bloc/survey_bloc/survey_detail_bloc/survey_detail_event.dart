part of 'survey_detail_bloc.dart';

abstract class SurveyDetailEvent extends Equatable {
  const SurveyDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchSurveyDetailEvent extends SurveyDetailEvent {
  final String baseUrl;
  final int id;
  const FetchSurveyDetailEvent(this.baseUrl, this.id);

  @override
  List<Object> get props => [baseUrl, id];
}