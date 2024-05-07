import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:pine/dto/dto.dart';
import 'package:equatable/equatable.dart';

class EventPagedDTO extends DTO with EquatableMixin {
	int? total;
	int? pages;
	List<EventDTO>? results;
	int? currentPage;
	int? pageSize;

	EventPagedDTO({this.total, this.pages, this.results, this.currentPage, this.pageSize});

	EventPagedDTO.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pages = json['pages'];
		if (json['results'] != null) {
			results = <EventDTO>[];
			json['results'].forEach((v) { results!.add(new EventDTO.fromJson(v)); });
		}
		currentPage = json['current_page'];
		pageSize = json['page_size'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['pages'] = this.pages;
		if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
		data['current_page'] = this.currentPage;
		data['page_size'] = this.pageSize;
		return data;
	}
  
   @override
  
   List<Object?> get props => [];
}

class EventDTO extends DTO with EquatableMixin{
	int? id;
	String? title;
	String? translation;
	int? totaleRighe;
	bool? isImported;
	String? url;
	int? municipalityId;
	String? municipalityName;
	String? slug;
	Null? aggregatorCategoryId;
	String? createdAt;
	String? excerpt;
	String? publishedAt;
	String? startDate;
	String? endDate;
	String? startTime;
	String? endTime;
	String? address;
	double? latitude;
	double? longitude;
	bool? featured;
	String? updatedAt;
	String? breve;
	bool? isChild;
	Null? luogoId;
	int? dateDiff;
	String? maxTempo;
	String? startTimeWithTimezone;
	String? endTimeWithTimezone;
	MImagesDTO? image;
	bool? hasImage;
	List<Argomenti>? argomenti;
	String? tipo;
	List<ItemCategoryDTO>? eventCategories;

	EventDTO({this.id, this.title, this.translation, this.totaleRighe, this.isImported, this.url, this.municipalityId, this.municipalityName, this.slug, this.aggregatorCategoryId, this.createdAt, this.excerpt, this.publishedAt, this.startDate, this.endDate, this.startTime, this.endTime, this.address, this.latitude, this.longitude, this.featured, this.updatedAt, this.breve, this.isChild, this.luogoId, this.dateDiff, this.maxTempo, this.startTimeWithTimezone, this.endTimeWithTimezone, this.image, this.hasImage, this.argomenti, this.tipo, this.eventCategories});

	EventDTO.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		translation = json['translation'];
		totaleRighe = json['totale_righe'];
		isImported = json['is_imported'];
		url = json['url'];
		municipalityId = json['municipality_id'];
		municipalityName = json['municipality_name'];
		slug = json['slug'];
		aggregatorCategoryId = json['aggregator_category_id'];
		createdAt = json['created_at'];
		excerpt = json['excerpt'];
		publishedAt = json['published_at'];
		startDate = json['start_date'];
		endDate = json['end_date'];
		startTime = json['start_time'];
		endTime = json['end_time'];
		address = json['address'];
		latitude = json['latitude'];
		longitude = json['longitude'];
		featured = json['featured'];
		updatedAt = json['updated_at'];
		breve = json['breve'];
		isChild = json['is_child'];
		luogoId = json['luogo_id'];
		dateDiff = json['date_diff'];
		maxTempo = json['max_tempo'];
		startTimeWithTimezone = json['start_time_with_timezone'];
		endTimeWithTimezone = json['end_time_with_timezone'];
		image = json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
		hasImage = json['has_image'];
		if (json['argomenti'] != null) {
			argomenti = <Argomenti>[];
			json['argomenti'].forEach((v) { argomenti!.add(new Argomenti.fromJson(v)); });
		}
		tipo = json['tipo'];
		if (json['event_categories'] != null) {
			eventCategories = <ItemCategoryDTO>[];
			json['event_categories'].forEach((v) { eventCategories!.add(new ItemCategoryDTO.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['title'] = this.title;
		data['translation'] = this.translation;
		data['totale_righe'] = this.totaleRighe;
		data['is_imported'] = this.isImported;
		data['url'] = this.url;
		data['municipality_id'] = this.municipalityId;
		data['municipality_name'] = this.municipalityName;
		data['slug'] = this.slug;
		data['aggregator_category_id'] = this.aggregatorCategoryId;
		data['created_at'] = this.createdAt;
		data['excerpt'] = this.excerpt;
		data['published_at'] = this.publishedAt;
		data['start_date'] = this.startDate;
		data['end_date'] = this.endDate;
		data['start_time'] = this.startTime;
		data['end_time'] = this.endTime;
		data['address'] = this.address;
		data['latitude'] = this.latitude;
		data['longitude'] = this.longitude;
		data['featured'] = this.featured;
		data['updated_at'] = this.updatedAt;
		data['breve'] = this.breve;
		data['is_child'] = this.isChild;
		data['luogo_id'] = this.luogoId;
		data['date_diff'] = this.dateDiff;
		data['max_tempo'] = this.maxTempo;
		data['start_time_with_timezone'] = this.startTimeWithTimezone;
		data['end_time_with_timezone'] = this.endTimeWithTimezone;
		if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
		data['has_image'] = this.hasImage;
		if (this.argomenti != null) {
      data['argomenti'] = this.argomenti!.map((v) => v.toJson()).toList();
    }
		data['tipo'] = this.tipo;
		if (this.eventCategories != null) {
      data['event_categories'] = this.eventCategories!.map((v) => v.toJson()).toList();
    }
		return data;
	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [];
}



class Argomenti {
	String? name;
	int? id;

	Argomenti({this.name, this.id});

	Argomenti.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}

class EventCategories {
	String? name;
	int? id;
	Null? color;

	EventCategories({this.name, this.id, this.color});

	EventCategories.fromJson(Map<String, dynamic> json) {
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
}