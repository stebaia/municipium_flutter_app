part of 'geolocation_bloc_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentPositionEvent extends GeolocationEvent {
  const GetCurrentPositionEvent();

  @override
  List<Object> get props => [];
}
