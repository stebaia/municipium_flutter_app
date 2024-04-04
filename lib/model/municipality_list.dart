import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipality.dart';

class MunicipalityList extends Equatable{
  final List<Municipality> municipalityList;
  const MunicipalityList({required this.municipalityList});
  
  @override
  List<Object?> get props => [municipalityList];
  
}