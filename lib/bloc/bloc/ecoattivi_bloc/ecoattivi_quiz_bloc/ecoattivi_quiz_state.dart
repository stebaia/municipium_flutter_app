part of 'ecoattivi_quiz_bloc.dart';

abstract class EcoattiviQuizState extends Equatable {
  const EcoattiviQuizState();

  @override
  List<Object> get props => [];
}

class FetchingEcoattiviQuizListState extends EcoattiviQuizState {
  const FetchingEcoattiviQuizListState();
}

class FetchedEcoattiviQuizListState extends EcoattiviQuizState {
  final List<EcoattiviQuiz> quizList;
  const FetchedEcoattiviQuizListState(this.quizList);

  @override
  List<Object> get props => [quizList];
}

class NoEcoattiviQuizListState extends EcoattiviQuizState {
  const NoEcoattiviQuizListState();
}

class ErrorEcoattiviQuizListState extends EcoattiviQuizState {
  const ErrorEcoattiviQuizListState();
}
