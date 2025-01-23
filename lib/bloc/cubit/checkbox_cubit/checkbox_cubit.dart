import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit()
      : super(false); // Lo stato iniziale della checkbox è "non selezionata".

  /// Inverte lo stato corrente della checkbox
  void toggle() => emit(!state);

  /// Imposta un valore specifico
  void setChecked(bool value) => emit(value);
}
