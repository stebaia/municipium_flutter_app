part of 'issue_list_bloc.dart';

abstract class IssueListEvent extends Equatable {
  const IssueListEvent();

  @override
  List<Object> get props => [];
}

class FetchIssueListEvent extends IssueListEvent {
  String baseUrl;
  String udid;
  FetchIssueListEvent(this.baseUrl, this.udid);
  @override
  List<Object> get props => [baseUrl];
}
