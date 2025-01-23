import 'package:flutter_bloc/flutter_bloc.dart';

class MaplistButtonCubit extends Cubit<bool> {
  MaplistButtonCubit() : super(false); // Stato iniziale: primo tab selezionato.

  void mapSelected(bool value) {
    emit(value);
  }
}
