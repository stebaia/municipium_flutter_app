import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/issue/issue_category_tag.dart';
import 'package:municipium/model/issue/issue_item_list.dart';
import 'package:municipium/repositories/issues_repository.dart';

part 'issue_list_event.dart';
part 'issue_list_state.dart';

class IssueListBloc extends Bloc<IssueListEvent, IssueListState> {
  final IssuesRepository issuesRepository;

  IssueListBloc({required this.issuesRepository})
      : super(const FetchingIssueListState()) {
    on<FetchIssueListEvent>(_fetchIssueList);
  }

  void fetchIssueList(String udid) => add(FetchIssueListEvent(udid));

  FutureOr<void> _fetchIssueList(FetchIssueListEvent fetchIssueListEvent,
      Emitter<IssueListState> emit) async {
    emit(const FetchingIssueListState());
    try {
      final issueItemList =
          await issuesRepository.getIssuesList(fetchIssueListEvent.udid);
      //final issueCategoryList = await issuesRepository.getIssueCategoryList();
      if (issueItemList.isNotEmpty) {
        emit(FetchedIssueListState(issueItemList));
      } else {
        emit(const NoIssueListState());
      }
    } catch (error) {
      emit(const ErrorIssueListState());
    }
  }
}
