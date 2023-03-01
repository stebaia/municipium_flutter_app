import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class AttachmentsDTO extends DTO with EquatableMixin{
	String? cloud;
	String? extension;
	String? file;
	int? size;
	String? contentType;
	String? name;

	AttachmentsDTO({this.cloud, this.extension, this.file, this.size, this.contentType, this.name});

	AttachmentsDTO.fromJson(Map<String, dynamic> json) {
		cloud = json['cloud'];
		extension = json['extension'];
		file = json['file'];
		size = json['size'];
		contentType = json['content_type'];
		name = json['name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cloud'] = this.cloud;
		data['extension'] = this.extension;
		data['file'] = this.file;
		data['size'] = this.size;
		data['content_type'] = this.contentType;
		data['name'] = this.name;
		return data;
	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [cloud, extension, file, size, contentType, name];
}