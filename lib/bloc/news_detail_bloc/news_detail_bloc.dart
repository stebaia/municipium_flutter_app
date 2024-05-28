import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/news_detail.dart';
import 'package:municipium/repositories/news_repository.dart';

part 'news_detail_event.dart';
part 'news_detail_state.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  final NewsRepository newsRepository;

  NewsDetailBloc({required this.newsRepository})
      : super(const FetchingNewsDetailState()) {
    on<FetchNewsDetailEvent>(_fetchNewsDetail);
  }

  void fetchNewsDetail(int newsId) => add(FetchNewsDetailEvent(newsId: newsId));

  FutureOr<void> _fetchNewsDetail(FetchNewsDetailEvent fetchNewsDetailEvent,
      Emitter<NewsDetailState> emit) async {
    emit(const FetchingNewsDetailState());
    try {
      final newsDetail =
          await newsRepository.getNewsDetail(fetchNewsDetailEvent.newsId);
      emit(FetchedNewsDetailState(newsDetail));
    } catch (error) {
      emit(const ErrorNewsDetailState());
    }
  }
}
