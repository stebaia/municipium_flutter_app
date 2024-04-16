import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipium_image.dart';

class Municipality extends Equatable {
  final String municipalityName;
  final int muninicipalityId;
  final String subdomain;
  final MunicipiumImage background;
  final MunicipiumImage logo;

  const Municipality(
      {required this.municipalityName,
      required this.muninicipalityId,
      required this.background,
      required this.logo,
      required this.subdomain});

  @override
  List<Object?> get props => [municipalityName, muninicipalityId, background, subdomain, logo];
}

