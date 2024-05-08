part of 'issue_tag_bloc.dart';

abstract class IssueTagState extends Equatable {
  const IssueTagState();

  @override
  List<Object> get props => [];
}

class FetchingIssueTagState extends IssueTagState {
  const FetchingIssueTagState();
}

class FetchedIssueTagState extends IssueTagState {
  final List<IssueMappedCategory> issueMappedList;
  const FetchedIssueTagState(this.issueMappedList);
  @override
  List<Object> get props => [issueMappedList];

  get issueTagList => null;
}

class NoIssueTagState extends IssueTagState {
  const NoIssueTagState();
}

class ErrorIssueTagState extends IssueTagState {
  const ErrorIssueTagState();
}
