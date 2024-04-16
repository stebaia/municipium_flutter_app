import 'package:equatable/equatable.dart';

class CivilDefenceEmergencyCall extends Equatable {
  final int id;
  final String name;
  final String number;

  const CivilDefenceEmergencyCall(
      {required this.id, required this.name, required this.number});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, number];
}
