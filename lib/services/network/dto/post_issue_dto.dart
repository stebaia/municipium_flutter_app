import 'package:municipium/model/issue/progress_issue.dart';
import 'package:pine/dto/dto.dart';

class PostIssueDto extends DTO {
  IssueContentDto? issue;
  String? udid;
  String? userAgent;

  PostIssueDto({this.issue, this.udid, this.userAgent});

  // fromJson factory method
  factory PostIssueDto.fromJson(Map<String, dynamic> json) {
    return PostIssueDto(
      issue: json['issue'] != null
          ? IssueContentDto.fromJson(json['issue'])
          : null,
      udid: json['udid'],
      userAgent: json['userAgent'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'issue': issue?.toJson(),
      'udid': udid,
      'userAgent': userAgent,
    };
  }
}

class IssueContentDto {
  int? municipalityId;
  String? municipalityName;
  String? latitude;
  String? longitude;
  String? address;
  String? content;
  String? phone;
  String? name;
  String? surname;
  String? email;
  int? issueCategoryId;
  ImageIssueDto? image1;
  ImageIssueDto? image2;
  ImageIssueDto? image3;
  ImageIssueDto? image4;

  IssueContentDto({
    this.municipalityId,
    this.municipalityName,
    this.latitude,
    this.longitude,
    this.address,
    this.content,
    this.phone,
    this.name,
    this.surname,
    this.email,
    this.issueCategoryId,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
  });

  // fromJson factory method
  factory IssueContentDto.fromJson(Map<String, dynamic> json) {
    return IssueContentDto(
      municipalityId: json['municipality_id'],
      municipalityName: json['municipalityName'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      content: json['content'],
      phone: json['phone'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      issueCategoryId: json['issue_category_id'],
      image1: json['image1'] != null
          ? ImageIssueDto.fromJson(json['image1'])
          : null,
      image2: json['image2'] != null
          ? ImageIssueDto.fromJson(json['image2'])
          : null,
      image3: json['image3'] != null
          ? ImageIssueDto.fromJson(json['image3'])
          : null,
      image4: json['image4'] != null
          ? ImageIssueDto.fromJson(json['image4'])
          : null,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'municipality_id': municipalityId,
      'municipalityName': municipalityName,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'content': content,
      'phone': phone,
      'name': name,
      'surname': surname,
      'email': email,
      'issue_category_id': issueCategoryId,
      'image1': image1?.toJson(),
      'image2': image2?.toJson(),
      'image3': image3?.toJson(),
      'image4': image4?.toJson(),
    };
  }
}

class ImageIssueDto {
  String? file;
  String? filename;
  String? originalFilename;

  ImageIssueDto({this.file, this.filename, this.originalFilename});

  // fromJson factory method
  factory ImageIssueDto.fromJson(Map<String, dynamic> json) {
    return ImageIssueDto(
      file: json['file'],
      filename: json['filename'],
      originalFilename: json['originalFilename'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'file': file,
      'filename': filename,
      'originalFilename': originalFilename,
    };
  }
}
