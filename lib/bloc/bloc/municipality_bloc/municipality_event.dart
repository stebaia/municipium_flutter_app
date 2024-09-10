part of 'municipality_bloc.dart';

abstract class MunicipalityEvent extends Equatable {
  const MunicipalityEvent();

  @override
  List<Object> get props => [];
}

class FetchMunicipalityEvent extends MunicipalityEvent {
  final int municipalityId;
  const FetchMunicipalityEvent({required this.municipalityId});
  @override
  List<Object> get props => [municipalityId];
}

class FetchMunicipalityListEvent extends MunicipalityEvent {
  const FetchMunicipalityListEvent();
  @override
  List<Object> get props => [];
}

class GetMunicipalityTemp extends MunicipalityEvent {
  const GetMunicipalityTemp();
  @override
  List<Object> get props => [];
}

class FilterMunicipalityListEvent extends MunicipalityEvent {
  final String filterText;

  const FilterMunicipalityListEvent({required this.filterText});

  @override
  List<Object> get props => [filterText];
}

class SetMunicipalityTempEvent extends MunicipalityEvent {
  final Municipality municipality;

  const SetMunicipalityTempEvent({required this.municipality});

  @override
  List<Object> get props => [municipality];
}

class FetchMunicipalityListWithPositionEvent extends MunicipalityEvent {
  final double lat;
  final double lng;
  const FetchMunicipalityListWithPositionEvent(
      {required this.lat, required this.lng});
  @override
  List<Object> get props => [];
}

class CheckConfigurationEvent extends MunicipalityEvent {
  const CheckConfigurationEvent();
}
