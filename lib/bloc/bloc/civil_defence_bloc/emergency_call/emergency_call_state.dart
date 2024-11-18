part of 'emergency_call_bloc.dart';

abstract class EmergencyCallState extends Equatable {
  const EmergencyCallState();

  @override
  List<Object> get props => [];
}

class FetchingEmergencyCallListState extends EmergencyCallState {
  const FetchingEmergencyCallListState();
}

class FetchedEmergencyCallListState extends EmergencyCallState {
  final List<CivilDefenceEmergencyCall> emergencyCallList;
  const FetchedEmergencyCallListState(this.emergencyCallList);
  @override
  List<Object> get props => [emergencyCallList];
}

class NoEmergencyCallListState extends EmergencyCallState {
  const NoEmergencyCallListState();
}

class ErrorEmergencyCallListState extends EmergencyCallState {
  const ErrorEmergencyCallListState();
}
