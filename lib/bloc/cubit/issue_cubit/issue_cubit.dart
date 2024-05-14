import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';

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
}
