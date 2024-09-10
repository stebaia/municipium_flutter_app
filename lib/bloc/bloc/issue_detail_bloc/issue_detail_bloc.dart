import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/issue/issue_Detail.dart';
import 'package:municipium/repositories/issues_repository.dart';

part 'issue_detail_event.dart';
part 'issue_detail_state.dart';

class IssueDetailBloc extends Bloc<IssueDetailEvent, IssueDetailState> {
  final IssuesRepository issueRepository;

  IssueDetailBloc({required this.issueRepository})
      : super(const FetchingIssueDetailState()) {
    on<FetchIssueDetailEvent>(_fetchIssueDetail);
  }

  void fetchIssueDetail(int issueId, String udid) =>
      add(FetchIssueDetailEvent(issueId: issueId, udid: udid));

  FutureOr<void> _fetchIssueDetail(FetchIssueDetailEvent fetchIssueDetailEvent,
      Emitter<IssueDetailState> emit) async {
    emit(const FetchingIssueDetailState());
    try {
      final issueDetail = await issueRepository.getIssueDetail(
          fetchIssueDetailEvent.issueId, fetchIssueDetailEvent.udid);
      emit(FetchedIssueDetailState(issueDetail));
    } catch (error) {
      emit(const ErrorIssueDetailState());
    }
  }
}
