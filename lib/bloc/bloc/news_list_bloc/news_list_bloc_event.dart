part of 'news_list_bloc_bloc.dart';

abstract class NewsListBlocEvent extends Equatable {
  const NewsListBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsListEvent extends NewsListBlocEvent {
  String baseUrl;
  FetchNewsListEvent(this.baseUrl);
  @override
  List<Object> get props => [baseUrl];
}

class FilterNewsListEvent extends NewsListBlocEvent {
  final String searchText;

  const FilterNewsListEvent(this.searchText);
  @override
  List<Object> get props => [searchText];
}

class FetchNewsListFromCategoryEvent extends NewsListBlocEvent {
  final String baseUrl;
  final int newsCategoryId;

  const FetchNewsListFromCategoryEvent(this.baseUrl,this.newsCategoryId);
  @override
  List<Object> get props => [newsCategoryId];
}
