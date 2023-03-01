part of 'news_detail_bloc.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsDetailEvent extends NewsDetailEvent {

  final int newsId;

  const FetchNewsDetailEvent({required this.newsId});
   @override
  List<Object> get props => [newsId];
}
