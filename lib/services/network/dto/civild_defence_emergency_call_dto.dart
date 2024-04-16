import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class CivilDefenceEmergencyCallDTO extends DTO with EquatableMixin {
  int? id;
  String? name;
  String? number;

  CivilDefenceEmergencyCallDTO({this.id, this.name, this.number});

  CivilDefenceEmergencyCallDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, number];
}
