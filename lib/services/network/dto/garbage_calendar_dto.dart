import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:pine/pine.dart';

class GarbageCalendarsDTO extends DTO with EquatableMixin{
	int? id;
	String? name;
	String? updatedAt;
	ZoneDTO? zone;
	String? calendarTypeName;
	MImagesDTO? calendarTypeIcon;
	MImagesDTO? calendarTypeIconGrey;

	GarbageCalendarsDTO({this.id, this.name, this.updatedAt, this.zone, this.calendarTypeName,});

	GarbageCalendarsDTO.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		updatedAt = json['updated_at'];
		zone = json['zone'] != null ? new ZoneDTO.fromJson(json['zone']) : null;
		calendarTypeName = json['calendar_type_name'];
		calendarTypeIcon = json['calendar_type_icon'] != null ? new MImagesDTO.fromJson(json['calendar_type_icon']) : null;
		calendarTypeIconGrey = json['calendar_type_icon_grey'] != null ? new MImagesDTO.fromJson(json['calendar_type_icon_grey']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['updated_at'] = this.updatedAt;
		if (this.zone != null) {
      data['zone'] = this.zone!.toJson();
    }
		data['calendar_type_name'] = this.calendarTypeName;
		if (this.calendarTypeIcon != null) {
      data['calendar_type_icon'] = this.calendarTypeIcon!.toJson();
    }
		if (this.calendarTypeIconGrey != null) {
      data['calendar_type_icon_grey'] = this.calendarTypeIconGrey!.toJson();
    }
		return data;
	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [id, name, updatedAt, zone, calendarTypeName, calendarTypeIcon, calendarTypeIconGrey];
}



class ZoneDTO extends DTO with EquatableMixin{
	String? name;
	String? description;

	ZoneDTO({this.name, this.description});

	ZoneDTO.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		description = json['description'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['description'] = this.description;
		return data;
	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [name, description];
}


