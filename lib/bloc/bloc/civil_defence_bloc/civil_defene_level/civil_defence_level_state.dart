part of 'civil_defence_level_bloc.dart';

abstract class CivilDefenceLevelsState extends Equatable {
  const CivilDefenceLevelsState();

  @override
  List<Object> get props => [];
}

class FetchingCivilDefenceLevelsState extends CivilDefenceLevelsState {
  const FetchingCivilDefenceLevelsState();
}

class FetchedCivilDefenceLevelsState extends CivilDefenceLevelsState {
  final CivilDefenceLevels civilDefenceLevels;
  const FetchedCivilDefenceLevelsState(this.civilDefenceLevels);

  @override
  List<Object> get props => [civilDefenceLevels];
}

class ErrorCivilDefenceLevelsState extends CivilDefenceLevelsState {
  const ErrorCivilDefenceLevelsState();
}
