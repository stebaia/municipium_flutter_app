import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuToggleVisibility { visible, invisible }

class MenuToggleCubit extends Cubit<MenuToggleVisibility> {
  MenuToggleCubit() : super(MenuToggleVisibility.invisible);

  bool toggleState = false;

  void toggle() {
    MenuToggleVisibility emitState = MenuToggleVisibility.invisible;
    emitState = toggleState
        ? MenuToggleVisibility.visible
        : MenuToggleVisibility.invisible;
    toggleState = !toggleState;
    emit(emitState);
  }
}
