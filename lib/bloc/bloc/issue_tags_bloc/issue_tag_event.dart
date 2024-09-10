part of 'issue_tag_bloc.dart';

abstract class IssueTagEvent extends Equatable {
  const IssueTagEvent();

  @override
  List<Object> get props => [];
}

class FetchIssueTagEvent extends IssueTagEvent {
  const FetchIssueTagEvent();
  @override
  List<Object> get props => [];
}
