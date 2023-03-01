part of 'news_list_bloc_bloc.dart';

abstract class NewsListBlocEvent extends Equatable {
  const NewsListBlocEvent();

  @override
  List<Object> get props => [];
}


class FetchNewsListEvent extends NewsListBlocEvent {
  const FetchNewsListEvent();
   @override
  List<Object> get props => [];
}
