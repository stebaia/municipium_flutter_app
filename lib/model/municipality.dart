import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/menu/municipium_menu.dart';
import 'package:municipium/services/network/dto/new_menu_dto.dart';

class Municipality extends Equatable {
  final String codiceSap;
  final String municipalityName;
  final int muninicipalityId;
  final String subdomain;
  final String? description;
  final int? citizensNumber;
  final String? surface;
  final String? zipCode;
  final String? prefix;
  final double lat;
  final double lng;
  final MunicipiumImage? background;
  final MunicipiumImage? logo;
  final MunicipiumImage? image;
  final NewMenuDTO newMenu;
  final String appServiceOne;
  final String appServiceTwo;
  final String appServiceThree;
  final String appServiceFour;
  final String jcityGovEnte;
  final String jcityGovUrl;
  final String province;
  final int istat;
  final String prenotationWebUrl;
  final String civilDefenceType;
  final List<int> civilDefenceNewsCategoryIds;
  Configurations? configurations;
  Municipality(
      {required this.codiceSap,
      required this.municipalityName,
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
      this.configurations,
      required this.jcityGovEnte,
      required this.jcityGovUrl,
      required this.province,
      required this.istat,
      required this.description,
      required this.citizensNumber,
      required this.surface,
      required this.zipCode,
      required this.prefix,
      required this.image,
      required this.civilDefenceType,
      required this.civilDefenceNewsCategoryIds,
      required this.prenotationWebUrl});
  factory Municipality.fromJsonFromShared(String jsonString) {
    final json = jsonDecode(jsonString);
    return Municipality(
        codiceSap: json['codice_sap'],
        municipalityName: json['name'],
        muninicipalityId: json['id'],
        lat: json['lat'],
        lng: json['lng'],
        logo: MunicipiumImage.fromJson(json['logo']),
        background: MunicipiumImage.fromJson(json['background']),
        subdomain: json['subdomain'],
        appServiceOne: json['appServiceOne'],
        appServiceTwo: json['appServiceTwo'],
        appServiceThree: json['appServiceThree'],
        appServiceFour: json['appServiceFour'],
        province: json['province'],
        newMenu: NewMenuDTO.fromJson(json['new_menu']),
        configurations: json['configurations'] != null
            ? Configurations.fromJson(json['configurations'])
            : null,
        jcityGovEnte: json['jcityGovEnte'] ?? '',
        jcityGovUrl: json['jcityGovUrl'] ?? '',
        istat: json['istat'] ?? -1,
        description: json['description'] ?? '',
        citizensNumber: json['citizens_number'] ?? 0,
        surface: json['surface'] ?? '',
        prefix: json['prefix'] ?? '',
        zipCode: json['zip_code'] ?? '',
        image: json['image'] ?? MunicipiumImage.fromJson(json['image']),
        civilDefenceNewsCategoryIds: json['civilDefenceNewsCategoryIds'] ?? [],
        civilDefenceType: json['civilDefenceType'],
        prenotationWebUrl: json['prenotationWebUrl']);
  }

  factory Municipality.fromJson(Map<String, dynamic> json) {
    return Municipality(
      municipalityName: json['name'],
      muninicipalityId: json['id'],
      lat: json['lat'],
      lng: json['lng'],
      logo: MunicipiumImage.fromJson(json['logo']),
      background: MunicipiumImage.fromJson(json['background']),
      subdomain: json['subdomain'],
      appServiceOne: json['appServiceOne'],
      appServiceTwo: json['appServiceTwo'],
      appServiceThree: json['appServiceThree'],
      appServiceFour: json['appServiceFour'],
      province: json['province'],
      newMenu: NewMenuDTO.fromJson(json['new_menu']),
      configurations: json['configurations'] != null
          ? Configurations.fromJson(json['configurations'])
          : null,
      jcityGovEnte: json['jcityGovEnte'] ?? '',
      jcityGovUrl: json['jcityGovUrl'] ?? '',
      citizensNumber: json['citizensNumber'] ?? 0,
      civilDefenceNewsCategoryIds: json['civilDefenceNewsCategoryIds'] ?? '',
      civilDefenceType: json['civilDefenceType'] ?? '',
      codiceSap: json['codiceSap'] ?? '',
      description: json['description'] ?? '',
      image: MunicipiumImage.fromJson(json['image']),
      istat: json['istat'] ?? '',
      prefix: json['prefix'] ?? '',
      prenotationWebUrl: json['prenotationWebUrl'] ?? [],
      surface: json['surface'] ?? '',
      zipCode: json['zipCode'] ?? '',
    );
  }

  // Metodo per serializzare l'oggetto Municipality in un JSON di tipo Map
  Map<String, dynamic> toJson() {
    return {
      'codice_sap': codiceSap,
      'name': municipalityName,
      'id': muninicipalityId,
      'lat': lat,
      'lng': lng,
      'logo': logo?.toJson(),
      'background': background?.toJson(),
      'image': image?.toJson(),
      'surface': surface,
      'description': description,
      'citizens_number': citizensNumber,
      'prefix': prefix,
      'zip_code': zipCode,
      'subdomain': subdomain,
      'appServiceOne': appServiceOne,
      'appServiceTwo': appServiceTwo,
      'appServiceThree': appServiceThree,
      'appServiceFour': appServiceFour,
      'province': province,
      'new_menu': newMenu.toJson(),
      'configurations': configurations?.toJson(),
      'jcityGovEnte': jcityGovEnte,
      'jcityGovUrl': jcityGovUrl,
      'istat': istat,
      'civilDefenceType': civilDefenceType,
      'civilDefenceNewsCategoryIds': civilDefenceNewsCategoryIds,
      'prenotationWebUrl': prenotationWebUrl
    };
  }

  @override
  List<Object?> get props => [
        codiceSap,
        municipalityName,
        muninicipalityId,
        background,
        subdomain,
        logo,
        lat,
        lng,
        newMenu,
        description,
        citizensNumber,
        surface,
        prefix,
        zipCode,
        appServiceOne,
        appServiceTwo,
        appServiceThree,
        appServiceFour,
        jcityGovEnte,
        jcityGovUrl,
        province,
        istat,
        civilDefenceType,
        prenotationWebUrl,
        civilDefenceNewsCategoryIds
      ];
}
