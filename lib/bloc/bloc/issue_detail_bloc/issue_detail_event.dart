part of 'issue_detail_bloc.dart';

abstract class IssueDetailEvent extends Equatable {
  const IssueDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchIssueDetailEvent extends IssueDetailEvent {
  final int issueId;
  final String udid;
  String baseUrl;

  FetchIssueDetailEvent(
      {required this.baseUrl, required this.issueId, required this.udid});
  @override
  List<Object> get props => [baseUrl, issueId, udid];
}
