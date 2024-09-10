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
  final List<IssueCategoryTag> issueCategoryList;

  const FetchedIssueTagState(this.issueMappedList, this.issueCategoryList);
  @override
  List<Object> get props => [issueMappedList, issueCategoryList];

  get issueTagList => null;

  IssueMappedCategory? getFromIssueCategoryId(int? issueCategoryId) {
    if (issueMappedList.where((e) => e.id == issueCategoryId).isNotEmpty) {
      return issueMappedList.where((e) => e.id == issueCategoryId).first;
    }
    return null;
  }

  IssueMappedCategory? getFromName(String? name) {
    if (issueMappedList.where((e) => e.name == name).isNotEmpty) {
      return issueMappedList.where((e) => e.name == name).first;
    }
    return null;
  }

  List<IssueMappedCategory> getFromTag(int tagId) {
    List<IssueMappedCategory> mappedList = [];
    List<IssueCategoryTag> list = [];
    for (var category in issueCategoryList) {
      for (var tag in category.tags) {
        if (tag == tagId) {
          list.add(category);
        }
      }
    }
    mappedList = list
        .map((e) => IssueMappedCategory(
            id: e.id,
            name: e.name,
            description: e.description,
            mandatoryMessage: e.mandatoryMessage,
            isSelectable: e.isSelectable))
        .toList();
    return mappedList;
  }
}

class NoIssueTagState extends IssueTagState {
  const NoIssueTagState();
}

class ErrorIssueTagState extends IssueTagState {
  const ErrorIssueTagState();
}
