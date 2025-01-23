import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<int> {
  TabCubit() : super(0); // Stato iniziale: primo tab selezionato.

  void selectTab(int index) {
    emit(index);
  }
}
