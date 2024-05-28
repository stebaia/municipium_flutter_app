import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class IssueCategoryTagDto extends DTO with EquatableMixin {
  int? id;
  String? name;
  String? description;
  bool? mandatoryMessage;
  String? eta;
  bool? isSelectable;
  List<int>? tags;

  IssueCategoryTagDto(
      {this.id,
      this.name,
      this.description,
      this.mandatoryMessage,
      this.eta,
      this.isSelectable,
      this.tags});

  IssueCategoryTagDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    mandatoryMessage = json['mandatory_message'];
    eta = json['eta'];
    isSelectable = json['is_selectable'];
    tags = json['tags'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['mandatory_message'] = this.mandatoryMessage;
    data['eta'] = this.eta;
    data['is_selectable'] = this.isSelectable;
    data['tags'] = this.tags;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, description, mandatoryMessage, eta, isSelectable, tags];
}
