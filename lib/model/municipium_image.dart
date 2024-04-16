import 'package:equatable/equatable.dart';

class MunicipiumImage extends Equatable {
  final String? i1280;
  final String? baseUrl;
  final String? i720x960;
  final String? i300x300;

  const MunicipiumImage({
    required this.i1280,
    required this.i300x300,
    required this.baseUrl,
    required this.i720x960,
  });

  @override
  List<Object?> get props => [
        i1280,
        baseUrl,
        i720x960,
        i300x300,
      ];

  Map<String, dynamic> toJson() {
    return {
      'i1280': i1280,
      'baseUrl': baseUrl,
      'i720x960': i720x960,
      'i300x300': i300x300,
    };
  }

  factory MunicipiumImage.fromJson(Map<String, dynamic> json) {
    return MunicipiumImage(
      i1280: json['i1280'],
      baseUrl: json['baseUrl'],
      i720x960: json['i720x960'],
      i300x300: json['i300x300'],
    );
  }
}
