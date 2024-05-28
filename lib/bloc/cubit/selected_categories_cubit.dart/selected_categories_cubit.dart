import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectionCubit extends Cubit<Map<int, bool>> {
  CategorySelectionCubit() : super({});

  void initialize(Map<int, bool> initialSelection) {
    emit(Map.from(initialSelection));
  }

  void toggleSelection(int categoryId, bool isSelected) {
    final newState = Map<int, bool>.from(state);
    newState[categoryId] = isSelected;
    emit(newState);
  }
}
