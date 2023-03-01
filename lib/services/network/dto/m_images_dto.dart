import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class MImagesDTO extends DTO with EquatableMixin {
  String? i1440x1920;
  String? i1334x750;
  String? thumb;
  String? i720x960;
  String? siteGallery;
  String? baseUrl;
  String? url;
  String? i150x150;
  String? siteBanner;
  String? i2048x1536;
  String? i1920x1280;
  String? cloud;
  String? i450x450;
  String? i1136x640;
  String? i1280x1920;
  String? i300x300;
  String? i320;
  String? i320x240;
  String? i640;
  String? site640480Limit;
  String? i1280;
  String? defaultVal;

  MImagesDTO(
      {this.i1440x1920,
      this.i1334x750,
      this.thumb,
      this.i720x960,
      this.siteGallery,
      this.baseUrl,
      this.url,
      this.i150x150,
      this.siteBanner,
      this.i2048x1536,
      this.i1920x1280,
      this.cloud,
      this.i450x450,
      this.defaultVal,
      this.i1136x640,
      this.i1280x1920,
      this.i300x300,
      this.i320,
      this.i320x240,
      this.i640,
      this.site640480Limit,
      this.i1280});

  MImagesDTO.fromJson(Map<String, dynamic> json) {
    i1440x1920 = json['i1440x1920'];
    i1334x750 = json['i1334x750'];
    thumb = json['thumb'];
    i720x960 = json['i720x960'];
    siteGallery = json['site_gallery'];
    baseUrl = json['base_url'];
    url = json['url'];
    i150x150 = json['i150x150'];
    siteBanner = json['site_banner'];
    i2048x1536 = json['i2048x1536'];
    i1920x1280 = json['i1920x1280'];
    cloud = json['cloud'];
    i450x450 = json['i450x450'];
    defaultVal = json['default'];
    i1136x640 = json['i1136x640'];
    i1280x1920 = json['i1280x1920'];
    i300x300 = json['i300x300'];
    i320 = json['i320'];
    i320x240 = json['i320x240'];
    i640 = json['i640'];
    site640480Limit = json['site_640_480_limit'];
    i1280 = json['i1280'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['i1440x1920'] = this.i1440x1920;
    data['i1334x750'] = this.i1334x750;
    data['thumb'] = this.thumb;
    data['i720x960'] = this.i720x960;
    data['site_gallery'] = this.siteGallery;
    data['base_url'] = this.baseUrl;
    data['url'] = this.url;
    data['i150x150'] = this.i150x150;
    data['site_banner'] = this.siteBanner;
    data['i2048x1536'] = this.i2048x1536;
    data['i1920x1280'] = this.i1920x1280;
    data['cloud'] = this.cloud;
    data['i450x450'] = this.i450x450;
    data['default'] = this.defaultVal;
    data['i1136x640'] = this.i1136x640;
    data['i1280x1920'] = this.i1280x1920;
    data['i300x300'] = this.i300x300;
    data['i320'] = this.i320;
    data['i320x240'] = this.i320x240;
    data['i640'] = this.i640;
    data['site_640_480_limit'] = this.site640480Limit;
    data['i1280'] = this.i1280;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        i1440x1920,
        i1334x750,
        thumb,
        i720x960,
        siteGallery,
        baseUrl,
        url,
        i150x150,
        siteBanner,
        i2048x1536,
        i1920x1280,
        cloud,
        i450x450,
        i1136x640,
        i1280x1920,
        i300x300,
        i320,
        i320x240,
        i640,
        site640480Limit,
        i1280,
        defaultVal
      ];
}
