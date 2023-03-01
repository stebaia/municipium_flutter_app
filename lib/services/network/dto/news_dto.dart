import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/attachment_dto.dart';
import 'package:municipium/services/network/dto/civil_defence_alerts_news_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:pine/dto/dto.dart';

class NewsDTO extends DTO with  EquatableMixin{
	int? id;
	String? title;
	String? content;
	int? municipalityId;
	String? municipalityName;
	String? slug;
	int? galleryId;
	int? galleryVideo;
	String? excerpt;
	String? url;
	String? publishedAt;
	String? address;
	bool? featured;
	String? updatedAt;
	int? aggregatorCategoryId;
	bool? fullscreen;
	int? tipo;
	String? subtitle;
	List<CivilDefenceAlertsNewsDTO>? civilDefenceAlerts;
	MImagesDTO? image;
	List<MImagesDTO>? images;
	List<ItemCategoryDTO>? newsCategories;
	String? subdomain;
	bool? isImported;
	List<AttachmentsDTO>? attachments;
	String? translation;

	NewsDTO({this.id, this.title, this.content, this.municipalityId, this.municipalityName, this.slug, this.galleryId, this.galleryVideo, this.excerpt, this.url, this.publishedAt, this.address, this.featured, this.updatedAt, this.aggregatorCategoryId, this.fullscreen, this.tipo, this.subtitle, this.civilDefenceAlerts, this.image, this.images, this.newsCategories, this.subdomain, this.isImported, this.attachments, this.translation,});

	NewsDTO.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		content = json['content'];
		municipalityId = json['municipality_id'];
		municipalityName = json['municipality_name'];
		slug = json['slug'];
		galleryId = json['gallery_id'];
		galleryVideo = json['gallery_video'];
		excerpt = json['excerpt'];
		url = json['url'];
		publishedAt = json['published_at'];
		address = json['address'];
		featured = json['featured'];
		updatedAt = json['updated_at'];
		aggregatorCategoryId = json['aggregator_category_id'];
		fullscreen = json['fullscreen'];
		tipo = json['tipo'];
		subtitle = json['subtitle'];
		if (json['civil_defence_alerts'] != null) {
			civilDefenceAlerts = <CivilDefenceAlertsNewsDTO>[];
			json['civil_defence_alerts'].forEach((v) { civilDefenceAlerts!.add(new CivilDefenceAlertsNewsDTO.fromJson(v)); });
		}
		image = json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
		if (json['images'] != null) {
			images = <MImagesDTO>[];
			json['images'].forEach((v) { images!.add(new MImagesDTO.fromJson(v)); });
		}
		if (json['news_categories'] != null) {
			newsCategories = <ItemCategoryDTO>[];
			json['news_categories'].forEach((v) { newsCategories!.add(new ItemCategoryDTO.fromJson(v)); });
		}
		subdomain = json['subdomain'];
		isImported = json['is_imported'];
		if (json['attachments'] != null) {
			attachments = <AttachmentsDTO>[];
			json['attachments'].forEach((v) { attachments!.add(AttachmentsDTO.fromJson(v)); });
		}
		translation = json['translation'];
		
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['title'] = this.title;
		data['content'] = this.content;
		data['municipality_id'] = this.municipalityId;
		data['municipality_name'] = this.municipalityName;
		data['slug'] = this.slug;
		data['gallery_id'] = this.galleryId;
		data['gallery_video'] = this.galleryVideo;
		data['excerpt'] = this.excerpt;
		data['url'] = this.url;
		data['published_at'] = this.publishedAt;
		data['address'] = this.address;
		data['featured'] = this.featured;
		data['updated_at'] = this.updatedAt;
		data['aggregator_category_id'] = this.aggregatorCategoryId;
		data['fullscreen'] = this.fullscreen;
		data['tipo'] = this.tipo;
		data['subtitle'] = this.subtitle;
	
		if (this.civilDefenceAlerts != null) {
      data['civil_defence_alerts'] = this.civilDefenceAlerts!.map((v) => v.toJson()).toList();
    }
		if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
		if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
		if (this.newsCategories != null) {
      data['news_categories'] = this.newsCategories!.map((v) => v.toJson()).toList();
    }
		data['subdomain'] = this.subdomain;
		data['is_imported'] = this.isImported;
		if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
		data['translation'] = this.translation;
		
		return data;
	}


  @override
   // TODO: implement props
   List<Object?> get props => [
      id,
      title,
      content,
      municipalityId,
      municipalityName,
      slug,
      galleryId,
      galleryVideo,
      excerpt,
      url,
      publishedAt,
      address,
      featured,
      updatedAt,
      aggregatorCategoryId,
      fullscreen,
      tipo,
      subdomain,
      newsCategories
   ];
}


  
   
