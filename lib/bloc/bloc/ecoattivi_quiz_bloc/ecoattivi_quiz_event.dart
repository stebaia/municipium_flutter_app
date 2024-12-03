part of 'ecoattivi_quiz_bloc.dart';

abstract class EcoattiviQuizEvent extends Equatable {
  const EcoattiviQuizEvent();

  @override
  List<Object> get props => [];
}

class FetchEcoattiviQuizEvent extends EcoattiviQuizEvent {
  final String baseUrl;
  final String token;
  final String guid;

  const FetchEcoattiviQuizEvent({
    required this.baseUrl,
    required this.token,
    required this.guid,
  });

  @override
  List<Object> get props => [baseUrl, token, guid];
}
