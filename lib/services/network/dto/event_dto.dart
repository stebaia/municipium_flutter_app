import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:pine/dto/dto.dart';
import 'package:equatable/equatable.dart';

class EventDTO extends DTO with EquatableMixin {
  int? id;
  String? slug;
  String? title;
  String? excerpt;
  String? url;
  String? publishedAt;
  String? startDate;
  int? municipalityId;
  Null? aggregatorCategoryId;
  String? endDate;
  String? startTime;
  String? endTime;
  String? address;
  double? latitude;
  double? longitude;
  bool? featured;
  String? startTimeWithTimezone;
  String? endTimeWithTimezone;
  MImagesDTO? image;
  bool? hasImage;
  List<ItemCategoryDTO>? eventCategories;

  EventDTO(
      {this.id,
      this.slug,
      this.title,
      this.excerpt,
      this.url,
      this.publishedAt,
      this.startDate,
      this.municipalityId,
      this.aggregatorCategoryId,
      this.endDate,
      this.startTime,
      this.endTime,
      this.address,
      this.latitude,
      this.longitude,
      this.featured,
      this.startTimeWithTimezone,
      this.endTimeWithTimezone,
      this.image,
      this.hasImage,
      this.eventCategories});

  EventDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    excerpt = json['excerpt'];
    url = json['url'];
    publishedAt = json['published_at'];
    startDate = json['start_date'];
    municipalityId = json['municipality_id'];
    aggregatorCategoryId = json['aggregator_category_id'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    featured = json['featured'];
    startTimeWithTimezone = json['start_time_with_timezone'];
    endTimeWithTimezone = json['end_time_with_timezone'];
    image =
        json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
    hasImage = json['has_image'];
    if (json['event_categories'] != null) {
      eventCategories = <ItemCategoryDTO>[];
      json['event_categories'].forEach((v) {
        eventCategories!.add(new ItemCategoryDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['excerpt'] = this.excerpt;
    data['url'] = this.url;
    data['published_at'] = this.publishedAt;
    data['start_date'] = this.startDate;
    data['municipality_id'] = this.municipalityId;
    data['aggregator_category_id'] = this.aggregatorCategoryId;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['featured'] = this.featured;
    data['start_time_with_timezone'] = this.startTimeWithTimezone;
    data['end_time_with_timezone'] = this.endTimeWithTimezone;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['has_image'] = this.hasImage;
    if (this.eventCategories != null) {
      data['event_categories'] =
          this.eventCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        slug,
        title,
        excerpt,
        url,
        publishedAt,
        startDate,
        municipalityId,
        aggregatorCategoryId,
        endDate,
        startTime,
        endTime,
        address,
        latitude,
        longitude,
        featured,
        startTimeWithTimezone,
        endTimeWithTimezone,
        image,
        hasImage,
        eventCategories
      ];
}
