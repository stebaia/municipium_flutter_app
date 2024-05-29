import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class ServicePnrrDTOResponse extends DTO with EquatableMixin {
  int? total;
  List<ServicePnrrDTO>? topics;

  ServicePnrrDTOResponse({required this.total, required this.topics});

  ServicePnrrDTOResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['topics'] != null) {
      topics = <ServicePnrrDTO>[];
      json['topics'].forEach((v) {
        topics!.add(new ServicePnrrDTO.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['topics'] = this.topics;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ServicePnrrDTO extends DTO with EquatableMixin {
  String? urn;
  List<String>? categoria;
  List<String>? argomenti;
  String? inEvidenza;
  String? url;
  int? sitePageId;
  String? title;
  String? shortDescription;
  String? updatedAt;
  bool? featured;
  String? itemType;

  ServicePnrrDTO(
      {this.urn,
      this.categoria,
      this.argomenti,
      this.inEvidenza,
      this.url,
      this.sitePageId,
      this.title,
      this.shortDescription,
      this.updatedAt,
      this.featured,
      this.itemType});

  ServicePnrrDTO.fromJson(Map<String, dynamic> json) {
    urn = json['urn'];
    if (json['categoria'] != null) {
      categoria = <String>[];
      json['categoria'].forEach((v) {
        categoria!.add(v);
      });
    }
    if (json['argomenti'] != null) {
      argomenti = <String>[];
      json['argomenti'].forEach((v) {
        argomenti!.add(v);
      });
    }
    inEvidenza = json['in_evidenza'];
    url = json['url'];
    sitePageId = json['site_page_id'];
    title = json['title'];
    shortDescription = json['short_description'];
    updatedAt = json['updated_at'];
    featured = json['featured'];
    itemType = json['item_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urn'] = this.urn;
    data['categoria'] = this.categoria;
    data['argomenti'] = this.argomenti;
    data['in_evidenza'] = this.inEvidenza;
    data['url'] = this.url;
    data['site_page_id'] = this.sitePageId;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['updated_at'] = this.updatedAt;
    data['featured'] = this.featured;
    data['item_type'] = this.itemType;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        urn,
        categoria,
        argomenti,
        inEvidenza,
        url,
        sitePageId,
        title,
        shortDescription,
        updatedAt,
        featured,
        itemType
      ];
}
