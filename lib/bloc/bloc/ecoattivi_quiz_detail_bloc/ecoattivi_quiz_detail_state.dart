part of 'ecoattivi_quiz_detail_bloc.dart';

abstract class EcoattiviQuizDetailState extends Equatable {
  const EcoattiviQuizDetailState();

  @override
  List<Object> get props => [];
}

class EcoattiviQuizDetailInitial extends EcoattiviQuizDetailState {}

class FetchingEcoattiviQuizDetailState extends EcoattiviQuizDetailState {
  const FetchingEcoattiviQuizDetailState();
}

class FetchedEcoattiviQuizDetailState extends EcoattiviQuizDetailState {
  final EcoattiviQuizDetail quizDetail;
  const FetchedEcoattiviQuizDetailState(this.quizDetail);

  @override
  List<Object> get props => [quizDetail];
}

class NoEcoattiviQuizDetailState extends EcoattiviQuizDetailState {
  const NoEcoattiviQuizDetailState();
}

class ErrorEcoattiviQuizDetailState extends EcoattiviQuizDetailState {
  const ErrorEcoattiviQuizDetailState();
}
