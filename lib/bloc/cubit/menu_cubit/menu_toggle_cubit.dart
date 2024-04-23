import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuToggleVisibility { visible, invisible }

class MenuToggleCubit extends Cubit<MenuToggleVisibility> {
  MenuToggleCubit() : super(MenuToggleVisibility.invisible);

  void toggle(bool visible) => emit(
      visible ? MenuToggleVisibility.visible : MenuToggleVisibility.invisible);
}
