import 'package:equatable/equatable.dart';

class Municipality extends Equatable {
  final String municipalityName;
  final int muninicipalityId;

  const Municipality({
    required this.municipalityName,
    required this.muninicipalityId
  });
  
  @override
  List<Object?> get props => [municipalityName, muninicipalityId];
}