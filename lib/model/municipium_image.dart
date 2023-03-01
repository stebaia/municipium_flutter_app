import 'package:equatable/equatable.dart';

class MunicipiumImage extends Equatable{
  final String? i1280;
  final String? baseUrl;
  final String? i720x960;
  final String? i300x300;

  const MunicipiumImage({
    required this.i1280,
    required this.i300x300,
    required this.baseUrl,
    required this.i720x960
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    i1280,
    baseUrl,
    i720x960,
    i300x300
  ];


}