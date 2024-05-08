part of 'issue_list_bloc.dart';

abstract class IssueListEvent extends Equatable {
  const IssueListEvent();

  @override
  List<Object> get props => [];
}

class FetchIssueListEvent extends IssueListEvent {
  const FetchIssueListEvent();
  @override
  List<Object> get props => [];
}
