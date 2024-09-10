part of 'emergency_call_bloc.dart';

abstract class EmergencyCallEvent extends Equatable {
  const EmergencyCallEvent();

  @override
  List<Object> get props => [];
}

class FetchEmergencyCallEvent extends EmergencyCallEvent {
  const FetchEmergencyCallEvent();
  @override
  List<Object> get props => [];
}
