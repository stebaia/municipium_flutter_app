import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/user/idp_model.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/repositories/user_repository.dart';
import 'package:municipium/services/network/dto/user_validated.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository})
      : super(const FetchingListIdpState()) {
    on<FetchListIdpEvent>(_fetchListIdp);
    on<FetchUserDataEvent>(_getUserDataSpid);
    on<LogoutUserDataEvent>(_logoutUser);
    on<ValidateUserDataEvent>(_validateUser);
  }

  void fetchListIdp(String baseUrl) => add(FetchListIdpEvent(baseUrl));
  void fetchUserSpid(String baseUrl, String authId, String municipalityId,
          String authSystem, String authIdOld) =>
      add(FetchUserDataEvent(
          baseUrl, authId, municipalityId, authSystem, authIdOld));
  void validatedUser(String baseUrl, SpidUserModel userSpidModel,
          String? codiceAmico, int istat, String token, bool privacy) =>
      add(ValidateUserDataEvent(baseUrl, userSpidModel, codiceAmico, istat,
          token, 'ecoattivi', privacy));
  void logoutUserSpid(
          String baseUrlMmc, String playerId, String cf, String udid) =>
      add(LogoutUserDataEvent(baseUrlMmc, playerId, cf, udid));

  FutureOr<void> _fetchListIdp(
      FetchListIdpEvent event, Emitter<UserState> emit) async {
    emit(const FetchingListIdpState());
    try {
      final listIdp = await userRepository.getIdps(event.baseUrl);
      if (listIdp.isNotEmpty) {
        emit(FetchedListIdpState(listIdp));
      } else {
        emit(const NoListIdpState());
      }
    } catch (e) {
      emit(const NoListIdpState());
    }
  }

  FutureOr<void> _getUserDataSpid(
      FetchUserDataEvent event, Emitter<UserState> emit) async {
    emit(const FetchingUserDataState());
    try {
      final SpidUserModel spidUserModel = await userRepository.getUserSpid(
          event.baseUrl,
          event.authId,
          event.municipalityId,
          event.authSystem,
          event.authIdOld);
      emit(FetchedUserDataState(spidUserModel));
    } catch (ex) {
      print('retrieveUserData: ${ex.toString()}');
      emit(const NoSpidUserState());
    }
  }

  FutureOr<void> _logoutUser(
      LogoutUserDataEvent event, Emitter<UserState> emit) async {
    emit(const FetchingUserDataState());
    try {
      final bool spidUserModel = await userRepository.logoutUser(
        event.baseUrlMmc,
        event.playerId,
        event.cf,
        event.udid,
      );
      emit(const NoSpidUserState());
    } catch (ex) {}
  }

  FutureOr<void> _validateUser(
      ValidateUserDataEvent event, Emitter<UserState> emit) async {
    emit(const FetchingValidateUserState());
    try {
      final userDetails = await userRepository.validateUserSpid(
          event.baseUrl,
          event.userSpidModel,
          event.token,
          event.istat,
          event.service,
          event.codiceAmico ?? '',
          event.privacy);
      emit(FetchedValidateUserState(userDetails));
    } catch (e) {
      emit(ErrorFetchingValidateUserState(e.toString()));
    }
  }
}
