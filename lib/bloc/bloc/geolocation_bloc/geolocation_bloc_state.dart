part of 'geolocation_bloc_bloc.dart';

sealed class GeolocationState extends Equatable {
  const GeolocationState();

  @override
  List<Object> get props => [];
}

class GeolocationInitialState extends GeolocationState {
  const GeolocationInitialState();
}

class TryGeolocationState extends GeolocationState {
  const TryGeolocationState();
}

final class GeolocationSuccessState extends GeolocationState {
  final Position currentPosition;

  const GeolocationSuccessState(this.currentPosition);

  @override
  List<Object> get props => [currentPosition];
}

final class GeolocationErrorState extends GeolocationState {
  final String error;

  const GeolocationErrorState(this.error);

  @override
  List<Object> get props => [error];
}
