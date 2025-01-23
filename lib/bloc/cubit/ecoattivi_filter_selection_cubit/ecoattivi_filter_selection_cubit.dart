import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class EcoattiviFilterSelectionCubit extends Cubit<FilterSelectionQuiz> {
  EcoattiviFilterSelectionCubit() : super(FilterSelectionQuiz.New);

  void changeTo(FilterSelectionQuiz value) {
    emit(value);
  }
}

enum FilterSelectionQuiz {
  New,
  Past;
}
