import 'package:municipium/services/network/dto/attachment_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';

class EventDetail {
  int? id;
  String? title;
  String? content;
  String? url;
  int? municipalityId;
  String? municipalityName;
  String? slug;
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
  bool? fullscreen;
  String? livello1;
  String? livello2;
  String? tipo;
  String? breve;
  Null? subtitle;
  String? rivoltoA;
  Null? parentId;
  String? costo;
  String? patrocinatoDa;
  String? sponsor;
  String? ulterioriInformazioni;
  MImagesDTO? image;
  List<MImagesDTO>? images;
  String? startTimeWithTimezone;
  String? endTimeWithTimezone;
  List<ItemCategoryDTO>? eventCategories;
  String? subdomain;
  bool? isImported;
  List<AttachmentsDTO>? attachments;
  String? translation;

  EventDetail(
      {this.id,
      this.title,
      this.content,
      this.url,
      this.municipalityId,
      this.municipalityName,
      this.slug,
      this.excerpt,
      this.publishedAt,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.address,
      this.latitude,
      this.longitude,
      this.featured,
      this.updatedAt,
      this.fullscreen,
      this.livello1,
      this.livello2,
      this.tipo,
      this.breve,
      this.subtitle,
      this.rivoltoA,
      this.parentId,
      this.costo,
      this.patrocinatoDa,
      this.sponsor,
      this.ulterioriInformazioni,
      this.image,
      this.images,
      this.startTimeWithTimezone,
      this.endTimeWithTimezone,
      this.eventCategories,
      this.subdomain,
      this.isImported,
      this.attachments,
      this.translation});

  EventDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    url = json['url'];
    municipalityId = json['municipality_id'];
    municipalityName = json['municipality_name'];
    slug = json['slug'];
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
    fullscreen = json['fullscreen'];
    livello1 = json['livello1'];
    livello2 = json['livello2'];
    tipo = json['tipo'];
    breve = json['breve'];
    subtitle = json['subtitle'];
    rivoltoA = json['rivolto_a'];
    parentId = json['parent_id'];
    costo = json['costo'];
    patrocinatoDa = json['patrocinato_da'];
    sponsor = json['sponsor'];
    ulterioriInformazioni = json['ulteriori_informazioni'];
    image =
        json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <MImagesDTO>[];
      json['images'].forEach((v) {
        images!.add(new MImagesDTO.fromJson(v));
      });
    }
    startTimeWithTimezone = json['start_time_with_timezone'];
    endTimeWithTimezone = json['end_time_with_timezone'];
    if (json['event_categories'] != null) {
      eventCategories = <ItemCategoryDTO>[];
      json['event_categories'].forEach((v) {
        eventCategories!.add(new ItemCategoryDTO.fromJson(v));
      });
    }
    subdomain = json['subdomain'];
    isImported = json['is_imported'];
    if (json['attachments'] != null) {
      attachments = <AttachmentsDTO>[];
      json['attachments'].forEach((v) {
        attachments!.add(new AttachmentsDTO.fromJson(v));
      });
    }
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['url'] = this.url;
    data['municipality_id'] = this.municipalityId;
    data['municipality_name'] = this.municipalityName;
    data['slug'] = this.slug;
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
    data['fullscreen'] = this.fullscreen;
    data['livello1'] = this.livello1;
    data['livello2'] = this.livello2;
    data['tipo'] = this.tipo;
    data['breve'] = this.breve;
    data['subtitle'] = this.subtitle;
    data['rivolto_a'] = this.rivoltoA;
    data['parent_id'] = this.parentId;
    data['costo'] = this.costo;
    data['patrocinato_da'] = this.patrocinatoDa;
    data['sponsor'] = this.sponsor;
    data['ulteriori_informazioni'] = this.ulterioriInformazioni;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['start_time_with_timezone'] = this.startTimeWithTimezone;
    data['end_time_with_timezone'] = this.endTimeWithTimezone;
    if (this.eventCategories != null) {
      data['event_categories'] =
          this.eventCategories!.map((v) => v.toJson()).toList();
    }
    data['subdomain'] = this.subdomain;
    data['is_imported'] = this.isImported;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    data['translation'] = this.translation;
    return data;
  }
}
