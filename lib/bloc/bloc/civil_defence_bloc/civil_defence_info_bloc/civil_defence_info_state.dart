part of 'civil_defence_info_bloc.dart';

abstract class CivilDefenceInformationsState extends Equatable {
  const CivilDefenceInformationsState();

  @override
  List<Object> get props => [];
}

class FetchingCivilDefenceInformationsState extends CivilDefenceInformationsState {
  const FetchingCivilDefenceInformationsState();
}

class FetchedCivilDefenceInformationsState extends CivilDefenceInformationsState {
  final List<CivilDefenceListInformations> civilDefenceInformations;
  const FetchedCivilDefenceInformationsState(this.civilDefenceInformations);

  @override
  List<Object> get props => [civilDefenceInformations];
}

class NoCivilDefenceInformationsState extends CivilDefenceInformationsState {
  const NoCivilDefenceInformationsState();
}

class ErrorCivilDefenceInformationsState extends CivilDefenceInformationsState {
  const ErrorCivilDefenceInformationsState();
}