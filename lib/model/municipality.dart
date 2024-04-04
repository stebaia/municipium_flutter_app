import 'package:equatable/equatable.dart';

class Municipality extends Equatable {
  final String municipalityName;
  final int muninicipalityId;
  final String subdomain;

  const Municipality(
      {required this.municipalityName,
      required this.muninicipalityId,
      required this.subdomain});

  @override
  List<Object?> get props => [municipalityName, muninicipalityId];
}

