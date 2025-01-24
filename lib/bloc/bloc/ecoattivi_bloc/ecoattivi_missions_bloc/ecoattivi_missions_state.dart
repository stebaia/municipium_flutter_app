part of 'ecoattivi_missions_bloc.dart';

abstract class EcoattiviMissionsState extends Equatable {
  const EcoattiviMissionsState();

  @override
  List<Object> get props => [];
}

class FetchingEcoattiviMissionsListState extends EcoattiviMissionsState {
  const FetchingEcoattiviMissionsListState();
}

class FetchedEcoattiviMissionsListState extends EcoattiviMissionsState {
  final List<EcoattiviMissione> missionsList;
  const FetchedEcoattiviMissionsListState(this.missionsList);

  @override
  List<Object> get props => [missionsList];
}

class NoEcoattiviMissionsListState extends EcoattiviMissionsState {
  const NoEcoattiviMissionsListState();
}

class ErrorEcoattiviMissionsListState extends EcoattiviMissionsState {
  const ErrorEcoattiviMissionsListState();
}
