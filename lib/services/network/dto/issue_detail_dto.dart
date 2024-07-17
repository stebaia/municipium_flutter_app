import 'package:municipium/services/network/dto/issue_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:pine/dto/dto.dart';

class IssueDetailDto extends DTO {
  int? id;
  String? content;
  double? latitude;
  double? longitude;
  String? address;
  String? createdAt;
  int? stato;
  bool? merged;
  IssueCategoryDTO? issueCategory;
  bool? closed;
  bool? archived;
  bool? started;
  bool? canceled;
  MImagesDTO? image;
  MImagesDTO? image2;
  MImagesDTO? image3;
  MImagesDTO? image4;
  List<String>? attachments;
  List<String>? email;

  IssueDetailDto(
      {this.id,
      this.content,
      this.latitude,
      this.longitude,
      this.address,
      this.createdAt,
      this.stato,
      this.merged,
      this.issueCategory,
      this.closed,
      this.archived,
      this.started,
      this.canceled,
      this.image,
      this.image2,
      this.image3,
      this.image4,
      this.attachments,
      this.email});

  IssueDetailDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    createdAt = json['created_at'];
    stato = json['stato'];
    merged = json['merged'];
    issueCategory = json['issue_category'] != null
        ? new IssueCategoryDTO.fromJson(json['issue_category'])
        : null;
    closed = json['closed'];
    archived = json['archived'];
    started = json['started'];
    canceled = json['canceled'];
    if (json['image'] != null) {
      image = json['image']['image'] != null
          ? MImagesDTO.fromJson(json['image']['image'])
          : null;
    }
    if (json['image2'] != null) {
      image2 = json['image2']['image'] != null
          ? MImagesDTO.fromJson(json['image2']['image'])
          : null;
    }
    if (json['image3'] != null) {
      image3 = json['image3']['image'] != null
          ? MImagesDTO.fromJson(json['image3']['image'])
          : null;
    }
    if (json['image4'] != null) {
      image4 = json['image4']['image'] != null
          ? MImagesDTO.fromJson(json['image4']['image'])
          : null;
    }
    if (json['email'] != null) {
      email = <String>[];
      json['email'].forEach((v) {
        email!.add(v);
      });
    }
    if (json['attachments'] != null) {
      attachments = <String>[];
      json['attachments'].forEach((v) {
        attachments!.add(v);
      });
    }
    if (json['email'] != null) {
      email = <String>[];
      json['email'].forEach((v) {
        email!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['stato'] = this.stato;
    data['merged'] = this.merged;
    if (this.issueCategory != null) {
      data['issue_category'] = this.issueCategory!.toJson();
    }
    data['closed'] = this.closed;
    data['archived'] = this.archived;
    data['started'] = this.started;
    data['canceled'] = this.canceled;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.image2 != null) {
      data['image2'] = this.image2!.toJson();
    }
    if (this.image3 != null) {
      data['image3'] = this.image3!.toJson();
    }
    if (this.image4 != null) {
      data['image4'] = this.image4!.toJson();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.toList();
    }
    if (this.email != null) {
      data['email'] = this.email!.toList();
    }
    return data;
  }
}
