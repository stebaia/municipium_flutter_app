import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:municipium/model/municipality.dart';

import 'package:municipium/repositories/municipality_repository.dart';

part 'municipality_global_state.dart';

class MunicipalityGlobalCubit extends Cubit<MunicipalityGlobalState> {
  final MunicipalityRepository municipalityRepository;
  final BuildContext context;
  MunicipalityGlobalCubit(
      {required this.municipalityRepository, required this.context})
      : super(const CheckMunicipalityGlobalState());

  void checkMunicipalityGlobalState() async {
    try {
      final municipality = await municipalityRepository.currentMunicipality;
      if (municipality != null) {
        if()
        emit(FetchedMunicipalityGlobalState(municipality));
      } else {
        emit(NotMunicipalityGlobalState());
      }
    } catch (e) {
      emit(NotMunicipalityGlobalState());
    }
  }

  void getStoredMunicipalityGlobalState() async {
    try {
      final municipality = await municipalityRepository.currentMunicipality;
      if (municipality != null) {
        emit(StoredMunicipalityGlobalState(municipality));
      } else {
        emit(NotMunicipalityGlobalState());
      }
    } catch (e) {
      emit(NotMunicipalityGlobalState());
    }
  }

  void authenticated(Municipality municipality) =>
      emit(StoredMunicipalityGlobalState(municipality));

  void deleteMunicipality() async {}

  /*void singOut(bool force) async {
    final user = await userRepository.logout(force, context);
    if (!force) {
      checkAuthenticationState();
    } else {
      emit(const NotAuthenticatedState());
    }
  }*/
}
