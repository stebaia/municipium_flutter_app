part of 'municipality_global_cubit.dart';

abstract class MunicipalityGlobalState extends Equatable {
  const MunicipalityGlobalState();

  @override
  List<Object> get props => [];
}

class StoredMunicipalityGlobalState extends MunicipalityGlobalState {
  final Municipality municipality;
  const StoredMunicipalityGlobalState(this.municipality);

  @override
  List<Object> get props => [municipality];
}

class FetchedMunicipalityGlobalState extends MunicipalityGlobalState {
  final Municipality municipality;
  const FetchedMunicipalityGlobalState(this.municipality);

  @override
  List<Object> get props => [municipality];
}

class NotMunicipalityGlobalState extends MunicipalityGlobalState {
  const NotMunicipalityGlobalState();
}

class CheckMunicipalityGlobalState extends MunicipalityGlobalState {
  const CheckMunicipalityGlobalState();
}
