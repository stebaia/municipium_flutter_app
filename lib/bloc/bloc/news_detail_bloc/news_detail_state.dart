part of 'news_detail_bloc.dart';

abstract class NewsDetailState extends Equatable {
  const NewsDetailState();

  @override
  List<Object> get props => [];
}

class FetchingNewsDetailState extends NewsDetailState {
  const FetchingNewsDetailState();
}

class FetchedNewsDetailState extends NewsDetailState {
  final NewsDetail newsDetail;
  const FetchedNewsDetailState(this.newsDetail);
  @override
  List<Object> get props => [newsDetail];

  get newsItemList => null;
}

class NoNewsDetailState extends NewsDetailState {
  const NoNewsDetailState();
}

class ErrorNewsDetailState extends NewsDetailState {
  const ErrorNewsDetailState();
}
