import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/civil_defence/civil_defence_emergency_call.dart';
import 'package:municipium/repositories/civil_defence_repository.dart';

part 'emergency_call_event.dart';
part 'emergency_call_state.dart';

class EmergencyCallBloc extends Bloc<EmergencyCallEvent, EmergencyCallState> {
  final CivilDefenceRepository civilDefenceRepository;

  EmergencyCallBloc({required this.civilDefenceRepository})
      : super(const FetchingEmergencyCallListState()) {
    on<FetchEmergencyCallEvent>(_fetchEmergencyCallList);
  }

  void fetchEmergencyCallList() => add(const FetchEmergencyCallEvent());

  FutureOr<void> _fetchEmergencyCallList(
      FetchEmergencyCallEvent fetchEmergencyCallEvent,
      Emitter<EmergencyCallState> emit) async {
    emit(const FetchingEmergencyCallListState());
    try {
      final emergencyCallList =
          await civilDefenceRepository.getCivilDefenceList();
      if (emergencyCallList.isNotEmpty) {
        emit(FetchedEmergencyCallListState(emergencyCallList));
      } else {
        emit(const NoEmergencyCallListState());
      }
    } catch (error) {
      emit(const ErrorEmergencyCallListState());
    }
  }
}
