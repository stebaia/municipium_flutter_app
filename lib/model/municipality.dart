import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/menu/municipium_menu.dart';
import 'package:municipium/services/network/dto/new_menu_dto.dart';

class Municipality extends Equatable {
  final String municipalityName;
  final int muninicipalityId;
  final String subdomain;
  final double lat;
  final double lng;
  final MunicipiumImage background;
  final MunicipiumImage logo;
  final NewMenuDTO newMenu;
  final String appServiceOne;
  final String appServiceTwo;
  final String appServiceThree;
  final String appServiceFour;
  final String jcityGovEnte;
  final String jcityGovUrl;

  const Municipality(
      {required this.municipalityName,
      required this.muninicipalityId,
      required this.background,
      required this.logo,
      required this.lat,
      required this.lng,
      required this.subdomain,
      required this.appServiceOne,
      required this.appServiceTwo,
      required this.appServiceThree,
      required this.appServiceFour,
      required this.newMenu,
      required this.jcityGovEnte,
      required this.jcityGovUrl});

  @override
  List<Object?> get props => [
        municipalityName,
        muninicipalityId,
        background,
        subdomain,
        logo,
        lat,
        lng,
        newMenu,
        appServiceOne,
        appServiceTwo,
        appServiceThree,
        appServiceFour,
        jcityGovEnte,
        jcityGovUrl
      ];
}
