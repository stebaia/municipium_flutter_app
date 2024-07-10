part of 'user_menu_conf_cubit_cubit.dart';


abstract class UserMenuConfCubitStandardState extends Equatable {
   @override
  List<Object> get props => [];
}

class UserMenuConfCubitState extends UserMenuConfCubitStandardState {
  UserMenuConfCubitState(this.configurationMenu);

  List<UserConfigurationMenu> configurationMenu;

  @override
  List<Object> get props => [];
}

class EditableUserMenuConfCubitState extends UserMenuConfCubitStandardState {
  EditableUserMenuConfCubitState(this.configurationMenu);

  List<UserConfigurationMenu> configurationMenu;

  @override
  List<Object> get props => [];
}



