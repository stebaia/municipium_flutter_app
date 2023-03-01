part of 'news_list_bloc_bloc.dart';

abstract class NewsListBlocState extends Equatable {
  const NewsListBlocState();
  
  @override
  List<Object> get props => [];
}

class FetchingNewsListState extends NewsListBlocState {
  const FetchingNewsListState();
}
class FetchedNewsListState extends NewsListBlocState {
  final List<NewsItemList> newsItemList;
  const FetchedNewsListState(this.newsItemList);
   @override
  List<Object> get props => [
    newsItemList
  ];
}
class NoNewsListState extends NewsListBlocState {
  const NoNewsListState();
}
class ErrorNewsListState extends NewsListBlocState {
  const ErrorNewsListState();
}
