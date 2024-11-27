import 'package:flutter_bloc/flutter_bloc.dart';

class BooleanCubit extends Cubit<bool> {
  BooleanCubit(this.initialValue) : super(initialValue);

  final bool initialValue;

  void setValue(bool value) {
    emit(value);
  }
}