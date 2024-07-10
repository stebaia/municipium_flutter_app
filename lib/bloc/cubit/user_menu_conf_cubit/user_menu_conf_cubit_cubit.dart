import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/repositories/user_repository.dart';

part 'user_menu_conf_cubit_state.dart';


class UserMenuConfigurationCubit extends HydratedCubit<List<UserConfigurationMenu>> {
  final UserRepository userRepository;

  UserMenuConfigurationCubit(this.userRepository) : super([]) {
    initialize();
  }

  Future<void> initialize() async {
    
      List<UserConfigurationMenu> conf = await userRepository.initUserMenuInShared();
      emit(conf);
    
  }

  void resetConf() {
    emit([]);
  }

  void addConfiguration(UserConfigurationMenu config) {
    state.add(config);
    emit(List.from(state)); // Emitti una nuova lista per aggiornare lo stato
  }

  void updateConfiguration(UserConfigurationMenu config, int index) {
    state[index] = config;
    emit(List.from(state));
  }

  void removeConfiguration(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }

  @override
  List<UserConfigurationMenu> fromJson(Map<String, dynamic> json) {
    return (json['configurations'] as List)
        .map((item) => UserConfigurationMenu.fromJson(item))
        .toList();
  }

  @override
  Map<String, dynamic> toJson(List<UserConfigurationMenu> state) {
    return {
      'configurations': state.map((item) => item.toJson()).toList(),
    };
  }
}