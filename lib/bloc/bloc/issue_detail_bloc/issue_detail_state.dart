part of 'issue_detail_bloc.dart';

abstract class IssueDetailState extends Equatable {
  const IssueDetailState();

  @override
  List<Object> get props => [];
}

class FetchingIssueDetailState extends IssueDetailState {
  const FetchingIssueDetailState();
}

class FetchedIssueDetailState extends IssueDetailState {
  final IssueDetail issueDetail;
  const FetchedIssueDetailState(this.issueDetail);
  @override
  List<Object> get props => [issueDetail];

  get newsItemList => null;
}

class NoIssueDetailState extends IssueDetailState {
  const NoIssueDetailState();
}

class ErrorIssueDetailState extends IssueDetailState {
  const ErrorIssueDetailState();
}
