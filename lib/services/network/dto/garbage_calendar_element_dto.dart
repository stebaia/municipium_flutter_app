import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:pine/pine.dart';

class CalendarElementDTO extends DTO with EquatableMixin{
	int? id;
	String? name;
	String? description;
	String? instructions;
	MImagesDTO? imageWhite;
	MImagesDTO? imageGreen;
	MImagesDTO? imageGrey;
	

	CalendarElementDTO({this.id, this.name, this.description, this.instructions, this.imageWhite, this.imageGreen, this.imageGrey,});

	CalendarElementDTO.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		description = json['description'];
		instructions = json['instructions'];
		imageWhite = json['image_white'] != null ? new MImagesDTO.fromJson(json['image_white']) : null;
		imageGreen = json['image_green'] != null ? new MImagesDTO.fromJson(json['image_green']) : null;
		imageGrey = json['image_grey'] != null ? new MImagesDTO.fromJson(json['image_grey']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['description'] = this.description;
		data['instructions'] = this.instructions;
		if (this.imageWhite != null) {
      data['image_white'] = this.imageWhite!.toJson();
    }
		if (this.imageGreen != null) {
      data['image_green'] = this.imageGreen!.toJson();
    }
		if (this.imageGrey != null) {
      data['image_grey'] = this.imageGrey!.toJson();
    }
		return data;
	}
  
   @override
   List<Object?> get props => [
     id,
     name,
     description,
     instructions,
     imageWhite,
     imageGreen,
     imageGrey, 
   ];

}