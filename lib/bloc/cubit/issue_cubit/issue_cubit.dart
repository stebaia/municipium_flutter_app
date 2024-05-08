import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_state.dart';
import 'package:municipium/model/issue/progress_issue.dart';

class IssueCubit extends Cubit<ProgressIssue> {
  IssueCubit() : super(ProgressIssue());

  void updateIssue(ProgressIssue issue) {
    emit(issue);
  }

  void setCategory(int id) {
    final updatedIssue = state.copyWith(issueCategoryId: id);
    emit(updatedIssue);
  }
}
