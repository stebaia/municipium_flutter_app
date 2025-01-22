part of 'survey_bloc.dart';

enum SurveyStatus { initial, loading, loaded, empty, error }

class SurveyListState extends Equatable {
  final List<Survey> activeSurveys;
  final List<Survey> archivedSurveys;
  final SurveyStatus activeSurveysStatus;
  final SurveyStatus archivedSurveysStatus;

  const SurveyListState({
    required this.activeSurveys,
    required this.archivedSurveys,
    required this.activeSurveysStatus,
    required this.archivedSurveysStatus,
  });

  factory SurveyListState.initial() => const SurveyListState(
        activeSurveys: [],
        archivedSurveys: [],
        activeSurveysStatus: SurveyStatus.initial,
        archivedSurveysStatus: SurveyStatus.initial,
      );

  SurveyListState copyWith({
    List<Survey>? activeSurveys,
    List<Survey>? archivedSurveys,
    SurveyStatus? activeSurveysStatus,
    SurveyStatus? archivedSurveysStatus,
  }) {
    return SurveyListState(
      activeSurveys: activeSurveys ?? this.activeSurveys,
      archivedSurveys: archivedSurveys ?? this.archivedSurveys,
      activeSurveysStatus: activeSurveysStatus ?? this.activeSurveysStatus,
      archivedSurveysStatus: archivedSurveysStatus ?? this.archivedSurveysStatus,
    );
  }

  @override
  List<Object?> get props => [
        activeSurveys,
        archivedSurveys,
        activeSurveysStatus,
        archivedSurveysStatus,
      ];
}