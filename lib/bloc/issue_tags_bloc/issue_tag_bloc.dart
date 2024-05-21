import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/issue/issue_category_tag.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/issue_tag.dart';
import 'package:municipium/repositories/issues_repository.dart';

part 'issue_tag_event.dart';
part 'issue_tag_state.dart';

class IssueTagBloc extends Bloc<IssueTagEvent, IssueTagState> {
  final IssuesRepository issuesRepository;

  IssueTagBloc({required this.issuesRepository})
      : super(const FetchingIssueTagState()) {
    on<FetchIssueTagEvent>(_fetchIssueTagsCategories);
  }

  void fetchIssueTagsCategories() => add(const FetchIssueTagEvent());

  FutureOr<void> _fetchIssueTagsCategories(
      FetchIssueTagEvent fetchNewsDetailEvent,
      Emitter<IssueTagState> emit) async {
    emit(const FetchingIssueTagState());
    try {
      final issueMappedList = await issuesRepository.getIssueCategoryTagList();
      final issueCategoryList = await issuesRepository.getIssueCategoryList();
      if (issueMappedList.isNotEmpty) {
        emit(FetchedIssueTagState(issueMappedList, issueCategoryList));
      } else {
        emit(const NoIssueTagState());
      }
    } catch (error) {
      emit(const ErrorIssueTagState());
    }
  }
}
