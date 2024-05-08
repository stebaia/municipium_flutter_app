import 'package:equatable/equatable.dart';

class ProgressIssue extends Equatable {
  String? address;
  String? email;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  int? issueCategoryId;
  String? latitude;
  String? longitude;
  String? municipalityId;
  String? name;
  String? phone;
  String? surname;
  String? content;

  ProgressIssue({
    this.address,
    this.email,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.issueCategoryId,
    this.latitude,
    this.longitude,
    this.municipalityId,
    this.name,
    this.phone,
    this.surname,
    this.content,
  });

  ProgressIssue copyWith(
      {String? address,
      String? email,
      String? image1,
      String? image2,
      String? image3,
      String? image4,
      int? issueCategoryId,
      String? latitude,
      String? longitude,
      String? municipalityId,
      String? name,
      String? phone,
      String? surname,
      String? content}) {
    return ProgressIssue(
      address: address ?? this.address,
      email: email ?? this.email,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      image3: image3 ?? this.image3,
      image4: image4 ?? this.image4,
      issueCategoryId: issueCategoryId ?? this.issueCategoryId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      municipalityId: municipalityId ?? this.municipalityId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      surname: surname ?? this.surname,
      content: content ?? this.content,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        address,
        email,
        image1,
        image2,
        image3,
        image4,
        issueCategoryId,
        latitude,
        longitude,
        municipalityId,
        name,
        surname,
        phone,
        content
      ];
}
