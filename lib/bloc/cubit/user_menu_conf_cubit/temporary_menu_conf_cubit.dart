import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/repositories/user_repository.dart';

class TemporaryConfigurationCubit extends Cubit<List<UserConfigurationMenu>> {
  UserRepository userRepository;
  TemporaryConfigurationCubit(this.userRepository) : super([]) {
    _initialize();
  }

  Future<void> _initialize() async {
    if (state.isEmpty) {
      List<UserConfigurationMenu> conf = await userRepository.initUserMenuInShared();
      emit(conf);
    }
  }
  
  void addConfiguration(UserConfigurationMenu config) {
    state.add(config);
    emit(List.from(state)); // Emitti una nuova lista per aggiornare lo stato
  }

  void updateConfiguration(UserConfigurationMenu config, int index) {
    state[index] = config;
    emit(List.from(state));
  }

  void removeConfiguration(UserConfigurationMenu config,) {
    config.isRemoved = true;
    emit(List.from(state));
  }

  void reset(List<UserConfigurationMenu> originalState) {
    emit(List.from(originalState));
  }
}