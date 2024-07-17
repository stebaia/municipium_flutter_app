part of 'municipality_bloc.dart';

abstract class MunicipalityState extends Equatable {
  const MunicipalityState();

  @override
  List<Object> get props => [];
}

class FetchingMunicipalityState extends MunicipalityState {
  const FetchingMunicipalityState();
}

class FetchedMunicipalityState extends MunicipalityState {
  final Municipality municipality;
  const FetchedMunicipalityState(this.municipality);

  List<Object> get props => [municipality];
}

class FetchedMunicipalityListState extends MunicipalityState {
  final List<Municipality> municipalityList;
  const FetchedMunicipalityListState(this.municipalityList);

  List<Object> get props => [municipalityList];
}

class NoMunicipalityState extends MunicipalityState {
  const NoMunicipalityState();
}

class ErrorMunicipalityState extends MunicipalityState {
  const ErrorMunicipalityState();
}

class ConfigurationFetchedState extends MunicipalityState {
  final Configurations configurations;
  const ConfigurationFetchedState(this.configurations);
}

class NoConfigurationState extends MunicipalityState {
  const NoConfigurationState();
}
