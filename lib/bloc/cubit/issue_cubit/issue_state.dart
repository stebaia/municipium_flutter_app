import 'package:equatable/equatable.dart';
import 'package:municipium/model/issue/progress_issue.dart';

abstract class IssueState extends Equatable {}

class IssueUpdatedState extends IssueState {
  final ProgressIssue? progressIssue;

  IssueUpdatedState(this.progressIssue);

  @override
  List<Object?> get props => [];
}

class IssueNoUpdatedState extends IssueState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
