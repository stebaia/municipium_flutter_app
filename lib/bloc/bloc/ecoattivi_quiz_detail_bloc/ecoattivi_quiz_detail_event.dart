part of 'ecoattivi_quiz_detail_bloc.dart';

abstract class EcoattiviQuizDetailEvent extends Equatable {
  const EcoattiviQuizDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchEcoattiviQuizDetailEvent extends EcoattiviQuizDetailEvent {
  final int quizId;
  final String baseUrl;
  final String guid;
  final String token;

  FetchEcoattiviQuizDetailEvent(
      {required this.baseUrl,
      required this.quizId,
      required this.guid,
      required this.token});

  @override
  List<Object> get props => [baseUrl, quizId, guid, token];
}
