import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/menu/municipium_menu.dart';
import 'package:municipium/services/network/dto/new_menu_dto.dart';

class Municipality extends Equatable {
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
  final String prenotationWebUrl;
  final String civilDefenceType;
  final List<int> civilDefenceNewsCategoryIds;
  Configurations? configurations;

  Municipality(
      {required this.municipalityName,
      required this.muninicipalityId,
      required this.background,
      required this.image,
      required this.logo,
      required this.lat,
      required this.lng,
      required this.surface,
      required this.zipCode,
      required this.prefix,
      required this.subdomain,
      required this.appServiceOne,
      required this.appServiceTwo,
      required this.appServiceThree,
      required this.appServiceFour,
      required this.newMenu,
      required this.description,
      required this.citizensNumber,
      this.configurations,
      required this.jcityGovEnte,
      required this.jcityGovUrl,
      required this.province,
      required this.civilDefenceType,
      required this.civilDefenceNewsCategoryIds,
      required this.prenotationWebUrl});

  factory Municipality.fromJsonFromShared(String jsonString) {
    final json = jsonDecode(jsonString);
    return Municipality(
        municipalityName: json['name'],
        muninicipalityId: json['id'],
        description: json['description'] ?? '',
        citizensNumber: json['citizens_number'] ?? 0,
        surface: json['surface'] ?? '',
        prefix: json['prefix'] ?? '',
        zipCode: json['zip_code'] ?? '',
        lat: json['lat'],
        lng: json['lng'],
        image: json['image'] ?? MunicipiumImage.fromJson(json['image']),
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
        civilDefenceNewsCategoryIds: json['civilDefenceNewsCategoryIds'] ?? [],
        civilDefenceType: json['civilDefenceType'],
        prenotationWebUrl: json['prenotationWebUrl']);
  }

  factory Municipality.fromJson(Map<String, dynamic> json) {
    return Municipality(
        municipalityName: json['name'],
        muninicipalityId: json['id'],
        surface: json['surface'] ?? '',
        description: json['description'] ?? '',
        citizensNumber: json['citizens_number'] ?? 0,
        prefix: json['prefix'] ?? '',
        zipCode: json['zip_code'] ?? '',
        lat: json['lat'],
        lng: json['lng'],
        image: MunicipiumImage.fromJson(json['image']),
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
        civilDefenceNewsCategoryIds: json['civilDefenceNewsCategoryIds'] ?? [],
        civilDefenceType: json['civilDefenceType'],
        prenotationWebUrl: json['prenotationWebUrl']);
  }

  // Metodo per serializzare l'oggetto Municipality in un JSON di tipo Map
  Map<String, dynamic> toJson() {
    return {
      'name': municipalityName,
      'id': muninicipalityId,
      'lat': lat,
      'lng': lng,
      'logo': logo?.toJson(),
      'background': background?.toJson(),
      'image' : image?.toJson(),
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
      'civilDefenceType': civilDefenceType,
      'civilDefenceNewsCategoryIds': civilDefenceNewsCategoryIds,
      'prenotationWebUrl': prenotationWebUrl
    };
  }

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
        civilDefenceType,
        prenotationWebUrl,
        civilDefenceNewsCategoryIds
      ];
}
