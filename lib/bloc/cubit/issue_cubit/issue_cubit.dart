import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/repositories/issues_repository.dart';
import 'package:municipium/services/network/dto/post_issue_dto.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'dart:convert';
import 'package:path/path.dart' as p;

class IssueCubit extends Cubit<ProgressIssue> {
  final IssuesRepository issuesRepository;

  IssueCubit({required this.issuesRepository}) : super(ProgressIssue());

  void setCategory(int id) {
    final updatedIssue = state.copyWith(issueCategoryId: id);
    emit(updatedIssue);
  }

  void setSubCategory(int? id) {
    final updatedIssue = state.copyWith(issueSubCategoryId: id);
    emit(updatedIssue);
  }

  void setCurrentPage(int page) {
    final updatedIssue = state.copyWith(currentPage: page);
    emit(updatedIssue);
  }

  void setSubList(List<IssueMappedCategory> list) {
    final updatedIssue = state.copyWith(subList: list);
    emit(updatedIssue);
  }

  void setName(String value) {
    final updatedIssue = state.copyWith(name: value);
    emit(updatedIssue);
  }

  void setSurname(String value) {
    final updatedIssue = state.copyWith(surname: value);
    emit(updatedIssue);
  }

  void setEmail(String value) {
    final updatedIssue = state.copyWith(email: value);
    emit(updatedIssue);
  }

  void setPhoneNUmber(String value) {
    final updatedIssue = state.copyWith(phone: value);
    emit(updatedIssue);
  }

  void setAddress(String value, {double? lat, double? lng}) {
    final updatedIssue = (lat != null && lng != null)
        ? state.copyWith(address: value, latitude: '$lat', longitude: '$lng')
        : state.copyWith(address: value);
    emit(updatedIssue);
    print("New state emitted: ${updatedIssue.address}");
  }

  void setMessage(String value) {
    final updatedIssue = state.copyWith(content: value);
    emit(updatedIssue);
  }

  void setNoPhoto(bool value) {
    final updatedIssue = state.copyWith(noPhoto: value);
    emit(updatedIssue);
  }

  void setImageList(List<XFile> list) async {
    final List<XFile> selectedImages = List.from(state.imageList ?? []);
    for (final XFile image in list) {
      final String normalizedImagePath = p.canonicalize(image.path);
      if (!selectedImages.any((XFile existingImage) =>
          p.canonicalize(existingImage.path) == normalizedImagePath)) {
        selectedImages.add(image);
      }
    }
    var updatedIssue = state.copyWith(imageList: selectedImages);

    emit(updatedIssue);
  }

  void removePhoto(int index) {
    final List<XFile> list = List<XFile>.from(state.imageList ?? []);
    if (list.length >= index + 1) {
      list.removeAt(index);
    }
    final updatedIssue = state.copyWith(imageList: List<XFile>.from(list));
    emit(updatedIssue);
  }

  void setPrivacy(bool value) {
    final updatedIssue = state.copyWith(privacy: value);
    emit(updatedIssue);
  }

  Future<ProgressIssue> buildMissingFields(
      DeviceBe? device, Municipality? municipality) async {
    String image1 = '';
    String image2 = '';
    String image3 = '';
    String image4 = '';
    if (state.imageList != null) {
      List<String> base64List =
          await MunicipiumUtility.convertToBase64(state.imageList!);

      for (var i = 0; i < base64List.length; i++) {
        if (i == 0) {
          //updatedIssue = state.copyWith(image1: base64List[i]);
          image1 = base64List[i];
        } else if (i == 1) {
          //updatedIssue = state.copyWith(image2: base64List[i]);
          image2 = base64List[i];
        } else if (i == 2) {
          //updatedIssue = state.copyWith(image3: base64List[i]);
          image3 = base64List[i];
        } else if (i == 3) {
          //updatedIssue = state.copyWith(image4: base64List[i]);
          image4 = base64List[i];
        }
      }
    }
    final updatedIssue = state.copyWith(
        image1: image1,
        image2: image2,
        image3: image3,
        image4: image4,
        udid: device?.udid,
        municipalityName: municipality?.municipalityName,
        municipalityId: '${municipality?.muninicipalityId}',
        userAgent: await MunicipiumUtility.createUserAgent());

    return updatedIssue;
  }

  Future<Map<String, bool>> postIssue(
      DeviceBe? device, Municipality? municipality) async {
    ProgressIssue issue = await buildMissingFields(device, municipality);
    PostIssueDto issueDto = issuesRepository.postIssueMapper.toDTO(issue);
    return issuesRepository.postIssue(issueDto);
  }
}
