part of 'issue_list_bloc.dart';

abstract class IssueListState extends Equatable {
  const IssueListState();

  @override
  List<Object> get props => [];
}

class FetchingIssueListState extends IssueListState {
  const FetchingIssueListState();
}

class FetchedIssueListState extends IssueListState {
  final List<IssueItemList> issueItemList;
  const FetchedIssueListState(this.issueItemList);
  @override
  List<Object> get props => [issueItemList];
}

class NoIssueListState extends IssueListState {
  const NoIssueListState();
}

class ErrorIssueListState extends IssueListState {
  const ErrorIssueListState();
}
