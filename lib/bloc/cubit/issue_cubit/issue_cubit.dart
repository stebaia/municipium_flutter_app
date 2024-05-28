import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:path/path.dart' as p;

class IssueCubit extends Cubit<ProgressIssue> {
  IssueCubit() : super(ProgressIssue());

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

  void setNameSurname(String value) {
    final updatedIssue = state.copyWith(name: value);
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

  void setAddress(String value) {
    final updatedIssue = state.copyWith(address: value);
    emit(updatedIssue);
  }

  void setMessage(String value) {
    final updatedIssue = state.copyWith(content: value);
    emit(updatedIssue);
  }

  void setNoPhoto(bool value) {
    final updatedIssue = state.copyWith(noPhoto: value);
    emit(updatedIssue);
  }

  void setImageList(List<XFile> list) {
    final List<XFile> selectedImages = List.from(state.imageList ?? []);
    for (final XFile image in list) {
      final String normalizedImagePath = p.canonicalize(image.path);
      if (!selectedImages.any((XFile existingImage) =>
          p.canonicalize(existingImage.path) == normalizedImagePath)) {
        selectedImages.add(image);
      }
    }
    final updatedIssue = state.copyWith(imageList: selectedImages);
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
}
