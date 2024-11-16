import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/repositories/user_repository.dart';

class TemporaryConfigurationCubit extends Cubit<List<UserConfigurationMenu>> {
  UserRepository userRepository;
  TemporaryConfigurationCubit(this.userRepository) : super([]) {}

  Future<void> initialize(String baseUrl, String municipalityId) async {
    List<UserConfigurationMenu> conf =
        await userRepository.initUserMenuInShared(baseUrl, municipalityId);
    emit(conf);
  }

  Future<List<UserConfigurationMenu>> getMunicipalityUser(
      String baseUrl, String municipalityId) async {
    try {
      final response = await userRepository.getMunicipalityUserService(
          baseUrl, municipalityId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void addConfiguration(UserConfigurationMenu config) {
    state.add(config);
    emit(List.from(state)); // Emitti una nuova lista per aggiornare lo stato
  }

  void updateConfiguration(UserConfigurationMenu config, int index) async {
    state[index] = config;
    await userRepository.updateConfiguration(config, index);
    emit(List.from(state));
  }

  void removeConfiguration(UserConfigurationMenu config, int index) async {
    config.isRemoved = true;

    emit(List.from(state));
  }

  void reset(List<UserConfigurationMenu> originalState) async {
    await userRepository.resetConfiguration(originalState);
    emit(List.from(originalState));
  }
}
