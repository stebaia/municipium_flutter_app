import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class IssueTagDto extends DTO with EquatableMixin {
  String? name;
  String? description;
  int? id;

  IssueTagDto({this.name, this.description, this.id});

  IssueTagDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, description, id];
}
