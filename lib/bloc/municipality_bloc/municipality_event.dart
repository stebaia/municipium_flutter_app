part of 'municipality_bloc.dart';

abstract class MunicipalityEvent extends Equatable {
  const MunicipalityEvent();

  @override
  List<Object> get props => [];
}

class FetchMunicipalityEvent extends MunicipalityEvent {
  final int municipalityId;
  String baseUrl;
  String baseUrlBe;
  FetchMunicipalityEvent(
      {required this.baseUrl,
      required this.baseUrlBe,
      required this.municipalityId});
  @override
  List<Object> get props => [baseUrl, municipalityId];
}

class FetchMunicipalityListEvent extends MunicipalityEvent {
  String baseUrl;
  FetchMunicipalityListEvent(this.baseUrl);
  @override
  List<Object> get props => [baseUrl];
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
  String baseUrl;
  FetchMunicipalityListWithPositionEvent(
      {required this.baseUrl, required this.lat, required this.lng});
  @override
  List<Object> get props => [];
}

class CheckConfigurationEvent extends MunicipalityEvent {
  const CheckConfigurationEvent();
}
