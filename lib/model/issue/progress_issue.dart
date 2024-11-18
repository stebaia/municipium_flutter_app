import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';

class ProgressIssue extends Equatable {
  String? address;
  String? email;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  int? issueCategoryId;
  int? issueSubCategoryId;
  String? latitude;
  String? longitude;
  String? municipalityId;
  String? name;
  String? phone;
  String? surname;
  String? content;
  String? udid;
  String? userAgent;
  String? municipalityName;
  int? currentPage;
  int? totalPage;
  List<IssueMappedCategory>? subList;
  bool? noPhoto;
  List<XFile>? imageList;
  bool? privacy;
  bool? loading;

  ProgressIssue(
      {this.address,
      this.email,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.issueCategoryId,
      this.issueSubCategoryId,
      this.latitude,
      this.longitude,
      this.municipalityId,
      this.name,
      this.phone,
      this.surname,
      this.content,
      this.udid,
      this.userAgent,
      this.municipalityName,
      bool? loading,
      int? currentPage, // Aggiunto currentPage come parametro opzionale
      this.totalPage,
      List<IssueMappedCategory>? subList,
      bool? noPhoto,
      List<XFile>? imageList,
      bool? privacy})
      : currentPage = currentPage ?? 0, // Imposta 0 se currentPage è null
        subList = subList ?? [],
        noPhoto = noPhoto ?? false,
        imageList = imageList ?? [],
        privacy = privacy ?? false,
        loading = loading ?? false;

  ProgressIssue copyWith(
      {String? address,
      String? email,
      String? image1,
      String? image2,
      String? image3,
      String? image4,
      int? issueCategoryId,
      int? issueSubCategoryId,
      String? latitude,
      String? longitude,
      String? municipalityId,
      String? name,
      String? phone,
      String? surname,
      String? content,
      String? udid,
      String? userAgent,
      String? municipalityName,
      int? currentPage,
      int? totalPage,
      List<IssueMappedCategory>? subList,
      bool? noPhoto,
      List<XFile>? imageList,
      bool? privacy,
      bool? loading}) {
    return ProgressIssue(
        address: address ?? this.address,
        email: email ?? this.email,
        image1: image1 ?? this.image1,
        image2: image2 ?? this.image2,
        image3: image3 ?? this.image3,
        image4: image4 ?? this.image4,
        issueCategoryId: issueCategoryId ?? this.issueCategoryId,
        issueSubCategoryId: issueSubCategoryId ?? this.issueSubCategoryId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        municipalityId: municipalityId ?? this.municipalityId,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        surname: surname ?? this.surname,
        content: content ?? this.content,
        udid: udid ?? this.udid,
        userAgent: userAgent ?? this.userAgent,
        municipalityName: municipalityName ?? this.municipalityName,
        currentPage: currentPage ?? this.currentPage,
        totalPage: totalPage ?? this.totalPage,
        subList: subList ?? this.subList,
        noPhoto: noPhoto ?? this.noPhoto,
        imageList: imageList ?? this.imageList,
        privacy: privacy ?? this.privacy,
        loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [
        address,
        email,
        image1,
        image2,
        image3,
        image4,
        issueCategoryId,
        issueSubCategoryId,
        latitude,
        longitude,
        municipalityId,
        name,
        surname,
        phone,
        content,
        udid,
        userAgent,
        municipalityName,
        currentPage,
        totalPage,
        subList,
        noPhoto,
        imageList,
        privacy,
        loading
      ];
}
