import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/garbage_calendar_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:pine/pine.dart';

class CalendarElementDTO extends DTO with EquatableMixin {
  int? id;
  String? name;
  String? description;
  String? instructions;
  MImagesDTO? imageWhite;
  MImagesDTO? imageGreen;
  MImagesDTO? imageGrey;
  List<GarbageCalendarsDTO>? garbage;

  CalendarElementDTO(
      {this.id,
      this.name,
      this.description,
      this.instructions,
      this.imageWhite,
      this.imageGreen,
      this.imageGrey,
      this.garbage});

  CalendarElementDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    instructions = json['instructions'];
    imageWhite = json['image_white'] != null
        ? new MImagesDTO.fromJson(json['image_white'])
        : null;
    imageGreen = json['image_green'] != null
        ? new MImagesDTO.fromJson(json['image_green'])
        : null;
    imageGrey = json['image_grey'] != null
        ? new MImagesDTO.fromJson(json['image_grey'])
        : null;
    if (json['garbage'] != null) {
      garbage = [];
      json['garbage'].forEach((v) {
        garbage!.add(GarbageCalendarsDTO.fromJson(v));
      });
    }
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
        garbage
      ];
}
