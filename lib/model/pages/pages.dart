import 'package:municipium/services/network/dto/attachment_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';

class Pages {
  final int id;
  String? slug;
  final String title;
  String? shortDescription;
  String? content;
  bool? featured;
  String? updatedAt;
  int? pageId;
  int? parentId;
  String? link;
  String? itemType;
  List<Pages>? children;
  List<MImagesDTO>? images;
  List<AttachmentsDTO>? attachments;

  Pages({
    required this.id,
    this.slug,
    required this.title,
    this.shortDescription,
    this.content,
    this.featured,
    this.updatedAt,
    this.pageId,
    this.parentId,
    this.link,
    this.itemType,
    this.children,
    this.images,
    this.attachments,
  });

  Pages.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        slug = json['slug'],
        title = json['title'],
        shortDescription = json['short_description'],
        content = json['content'],
        featured = json['featured'],
        updatedAt = json['updated_at'],
        pageId = json['page_id'],
        parentId = json['parent_id'],
        link = json['link'],
        itemType = json['item_type'],
        children = json['children'] != null
            ? (json['children'] as List).map((v) => Pages.fromJson(v)).toList()
            : null,
        images = json['images'] != null
            ? (json['images'] as List).map((v) {
              print(v);
              return MImagesDTO.fromJson(v['image']);
            }).toList()
            : null,
        attachments = json['attachments'] != null
            ? (json['attachments'] as List).map((v) => AttachmentsDTO.fromJson(v)).toList()
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['content'] = content;
    data['featured'] = featured;
    data['updated_at'] = updatedAt;
    data['page_id'] = pageId;
    data['parent_id'] = parentId;
    data['link'] = link;
    data['item_type'] = itemType;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
