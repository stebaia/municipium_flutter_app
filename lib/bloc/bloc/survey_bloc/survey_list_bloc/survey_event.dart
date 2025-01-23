part of 'survey_bloc.dart';

abstract class SurveyListEvent extends Equatable {
  const SurveyListEvent();

  @override
  List<Object> get props => [];
}

class FetchSurveyArchivedListEvent extends SurveyListEvent {
  final String baseUrl;
  final String type;
  final String udid;
  const FetchSurveyArchivedListEvent(this.baseUrl, this.type, this.udid);

  @override
  List<Object> get props => [baseUrl, type, udid];
}

class FetchSurveyActiveListEvent extends SurveyListEvent {
  final String baseUrl;
  final String type;
  final String udid;
  const FetchSurveyActiveListEvent(this.baseUrl, this.type, this.udid);

  @override
  List<Object> get props => [baseUrl, type, udid];
}