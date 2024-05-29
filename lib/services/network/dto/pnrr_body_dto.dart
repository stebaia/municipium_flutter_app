import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class PnrrBodyResponseDto extends DTO with EquatableMixin {
  Image? image;
  String? updatedAt;
  Metatag? metatag;
  String? callToAction;
  String? subtitle;
  int? id;
  bool? state;
  String? shortDescription;
  String? title;
  List<PnrrBodyDto>? body;
  List<ArgomentoPnrr>? argomenti;
  bool? sso;

  PnrrBodyResponseDto(
      {this.image,
      this.updatedAt,
      this.metatag,
      this.callToAction,
      this.subtitle,
      this.id,
      this.state,
      this.shortDescription,
      this.title,
      this.body,
      this.argomenti,
      this.sso});

  PnrrBodyResponseDto.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    updatedAt = json['updated_at'];
    metatag =
        json['metatag'] != null ? new Metatag.fromJson(json['metatag']) : null;
    callToAction = json['call_to_action'];
    subtitle = json['subtitle'];
    id = json['id'];
    state = json['state'];
    shortDescription = json['shortDescription'];
    title = json['title'];
    if (json['body'] != null) {
      body = <PnrrBodyDto>[];
      json['body'].forEach((v) {
        body!.add(new PnrrBodyDto.fromJson(v));
      });
    }
    if (json['argomenti'] != null) {
      argomenti = <ArgomentoPnrr>[];
      json['argomenti'].forEach((v) {
        argomenti!.add(new ArgomentoPnrr.fromJson(v));
      });
    }
    sso = json['sso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    if (this.metatag != null) {
      data['metatag'] = this.metatag!.toJson();
    }
    data['call_to_action'] = this.callToAction;
    data['subtitle'] = this.subtitle;
    data['id'] = this.id;
    data['state'] = this.state;
    data['shortDescription'] = this.shortDescription;
    data['title'] = this.title;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    if (this.argomenti != null) {
      data['argomenti'] = this.argomenti!.map((v) => v.toJson()).toList();
    }
    data['sso'] = this.sso;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Image {
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
  String? defaultImage;
  String? i1136x640;
  String? i1280x1920;
  String? i300x300;
  String? i320;
  String? i320x240;
  String? i640;
  String? site640480Limit;
  String? i1280;

  Image(
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
      this.defaultImage,
      this.i1136x640,
      this.i1280x1920,
      this.i300x300,
      this.i320,
      this.i320x240,
      this.i640,
      this.site640480Limit,
      this.i1280});

  Image.fromJson(Map<String, dynamic> json) {
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
    defaultImage = json['default'];
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
    data['default'] = this.defaultImage;
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
}

class Metatag {
  String? name;
  String? serviceType;
  ServiceOperator? serviceOperator;
  ServiceOperator? areaServed;
  Audience? audience;
  AvailableChannel? availableChannel;

  Metatag(
      {this.name,
      this.serviceType,
      this.serviceOperator,
      this.areaServed,
      this.audience,
      this.availableChannel});

  Metatag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    serviceType = json['serviceType'];
    serviceOperator = json['serviceOperator'] != null
        ? new ServiceOperator.fromJson(json['serviceOperator'])
        : null;
    areaServed = json['areaServed'] != null
        ? new ServiceOperator.fromJson(json['areaServed'])
        : null;
    audience = json['audience'] != null
        ? new Audience.fromJson(json['audience'])
        : null;
    availableChannel = json['availableChannel'] != null
        ? new AvailableChannel.fromJson(json['availableChannel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['serviceType'] = this.serviceType;
    if (this.serviceOperator != null) {
      data['serviceOperator'] = this.serviceOperator!.toJson();
    }
    if (this.areaServed != null) {
      data['areaServed'] = this.areaServed!.toJson();
    }
    if (this.audience != null) {
      data['audience'] = this.audience!.toJson();
    }
    if (this.availableChannel != null) {
      data['availableChannel'] = this.availableChannel!.toJson();
    }
    return data;
  }
}

class ServiceOperator {
  String? name;

  ServiceOperator({this.name});

  ServiceOperator.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Audience {
  String? name;
  String? audienceType;

  Audience({this.name, this.audienceType});

  Audience.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    audienceType = json['audienceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['audienceType'] = this.audienceType;
    return data;
  }
}

class AvailableChannel {
  ServiceLocation? serviceLocation;
  String? serviceUrl;

  AvailableChannel({this.serviceLocation, this.serviceUrl});

  AvailableChannel.fromJson(Map<String, dynamic> json) {
    serviceLocation = json['serviceLocation'] != null
        ? new ServiceLocation.fromJson(json['serviceLocation'])
        : null;
    serviceUrl = json['serviceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceLocation != null) {
      data['serviceLocation'] = this.serviceLocation!.toJson();
    }
    data['serviceUrl'] = this.serviceUrl;
    return data;
  }
}

class ServiceLocation {
  Address? address;
  String? name;

  ServiceLocation({this.address, this.name});

  ServiceLocation.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Address {
  String? streetAddress;
  String? postalCode;
  String? addressLocality;

  Address({this.streetAddress, this.postalCode, this.addressLocality});

  Address.fromJson(Map<String, dynamic> json) {
    streetAddress = json['streetAddress'];
    postalCode = json['postalCode'];
    addressLocality = json['addressLocality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streetAddress'] = this.streetAddress;
    data['postalCode'] = this.postalCode;
    data['addressLocality'] = this.addressLocality;
    return data;
  }
}

class PnrrBodyDto extends DTO with EquatableMixin {
  List<String>? values;
  String? name;
  String? type;
  String? value;
  String? urlPrenotazione;
  String? url;
  List<ContentPnrr>? content;

  PnrrBodyDto(
      {this.values,
      this.name,
      this.type,
      this.value,
      this.urlPrenotazione,
      this.url,
      this.content});

  PnrrBodyDto.fromJson(Map<String, dynamic> json) {
    if (json['values'] != null) {
      values = [];
      json['values'].forEach((v) {
        values!.add(v);
      });
    }
    name = json['name'];
    type = json['type'];
    value = json['value'];
    urlPrenotazione = json['urlPrenotazione'];
    url = json['url'];
    if (json['content'] != null) {
      content = <ContentPnrr>[];
      json['content'].forEach((v) {
        content!.add(new ContentPnrr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['values'] = this.values;
    data['name'] = this.name;
    data['type'] = this.type;
    data['value'] = this.value;
    data['urlPrenotazione'] = this.urlPrenotazione;
    data['url'] = this.url;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ContentPnrr {
  String? cloud;
  String? file;
  String? name;
  String? titolo;
  int? tipo;
  String? valore;
  String? label;
  String? updatedAt;
  int? id;
  String? description;
  String? slug;
  int? sedePrincipale;
  String? documentUrl;
  double? latitude;
  double? longitude;
  String? address;
  String? title;

  ContentPnrr(
      {this.cloud,
      this.file,
      this.name,
      this.titolo,
      this.tipo,
      this.valore,
      this.label,
      this.updatedAt,
      this.id,
      this.description,
      this.slug,
      this.sedePrincipale,
      this.documentUrl,
      this.longitude,
      this.latitude,
      this.address,
      this.title});

  ContentPnrr.fromJson(Map<String, dynamic> json) {
    cloud = json['cloud'];
    file = json['file'];
    name = json['name'];
    titolo = json['titolo'];
    tipo = json['tipo'];
    valore = json['valore'];
    label = json['label'];
    updatedAt = json['updated_at'];
    id = json['id'];
    description = json['description'];
    slug = json['slug'];
    sedePrincipale = json['sede_principale'];
    documentUrl = json['document_url'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cloud'] = this.cloud;
    data['file'] = this.file;
    data['name'] = this.name;
    data['titolo'] = this.titolo;
    data['tipo'] = this.tipo;
    data['valore'] = this.valore;
    data['label'] = this.label;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['sede_principale'] = this.sedePrincipale;
    data['document_url'] = this.documentUrl;
    return data;
  }
}

class ArgomentoPnrr {
  int? id;
  String? name;

  ArgomentoPnrr({this.id, this.name});

  ArgomentoPnrr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
