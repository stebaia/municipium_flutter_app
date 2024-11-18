import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_bloc_state.dart';
part 'geolocation_bloc_event.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc() : super(const GeolocationInitialState()) {
    on<GetCurrentPositionEvent>(_getCurrentPosition);
  }

  void getCurrentPosition() => add(const GetCurrentPositionEvent());

  _getCurrentPosition(
      GetCurrentPositionEvent event, Emitter<GeolocationState> emitter) async {
    emit(const TryGeolocationState());
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // check if geolocation service is enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'geolocation_disabled';
      }

      // check geolocation permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'geolocation_denied';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'geolocation_permanent_denied';
      }

      // get user current position
      Position position = await Geolocator.getCurrentPosition();

      emit(GeolocationSuccessState(position));

      //emit(LoggedInState(user));
    } catch (e) {
      emit(GeolocationErrorState(e.toString()));
    }
  }
}
