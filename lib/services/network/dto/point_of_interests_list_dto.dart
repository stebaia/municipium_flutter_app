import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:pine/dto/dto.dart';

class PointOfInterestsDTO extends  DTO with EquatableMixin{
	int? currentPage;
	int? pageSize;
	int? pages;
	int? totalPoi;
	List<PointOfInterestsItemDTO>? result;

	PointOfInterestsDTO({this.currentPage, this.pageSize, this.pages, this.totalPoi, this.result});

	PointOfInterestsDTO.fromJson(Map<String, dynamic> json) {
		currentPage = json['current_page'];
		pageSize = json['page_size'];
		pages = json['pages'];
		totalPoi = json['total_poi'];
		if (json['result'] != null) {
			result = <PointOfInterestsItemDTO>[];
			json['result'].forEach((v) { result!.add(new PointOfInterestsItemDTO.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['current_page'] = this.currentPage;
		data['page_size'] = this.pageSize;
		data['pages'] = this.pages;
		data['total_poi'] = this.totalPoi;
		if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
		return data;
	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [currentPage, pageSize, pages, totalPoi, result];
}

class PointOfInterestsItemDTO extends DTO with EquatableMixin {
	int? id;
	String? slug;
	String? name;
	String? longitude;
	String? latitude;
	String? address;
	String? municipality;
	int? municipalityId;
	String? type;
	List<ItemCategoryDTO>? pointOfInterestCategories;
	MImagesDTO? image;

	PointOfInterestsItemDTO({this.id, this.slug, this.name, this.longitude, this.latitude, this.address, this.municipality, this.municipalityId, this.type, this.pointOfInterestCategories, this.image});

	PointOfInterestsItemDTO.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		slug = json['slug'];
		name = json['name'];
		longitude = json['longitude'];
		latitude = json['latitude'];
		address = json['address'];
		municipality = json['municipality'];
		municipalityId = json['municipality_id'];
		type = json['type'];
		if (json['point_of_interest_categories'] != null) {
			pointOfInterestCategories = <ItemCategoryDTO>[];
			json['point_of_interest_categories'].forEach((v) { pointOfInterestCategories!.add(new ItemCategoryDTO.fromJson(v)); });
		}
		image = json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['slug'] = this.slug;
		data['name'] = this.name;
		data['longitude'] = this.longitude;
		data['latitude'] = this.latitude;
		data['address'] = this.address;
		data['municipality'] = this.municipality;
		data['municipality_id'] = this.municipalityId;
		data['type'] = this.type;
		if (this.pointOfInterestCategories != null) {
      data['point_of_interest_categories'] = this.pointOfInterestCategories!.map((v) => v.toJson()).toList();
    }
		if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
		return data;
	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [id, slug, longitude, latitude, address, municipality, municipalityId, type, pointOfInterestCategories,];
}


