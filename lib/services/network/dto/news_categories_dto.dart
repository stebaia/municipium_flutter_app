import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';


class ItemCategoryDTO extends DTO with EquatableMixin{
	String? name;
	int? id;
	String? color;

	ItemCategoryDTO({this.name, this.id, this.color});

	ItemCategoryDTO.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
		color = json['color'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		data['color'] = this.color;
		return data;
	}

  @override
   // TODO: implement props
   List<Object?> get props => [
    name,
    id,
    color
   ];

}