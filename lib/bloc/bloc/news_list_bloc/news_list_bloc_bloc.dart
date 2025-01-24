import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/news/news_item_list.dart';
import 'package:municipium/repositories/news_repository.dart';

part 'news_list_bloc_event.dart';
part 'news_list_bloc_state.dart';

class NewsListBloc extends Bloc<NewsListBlocEvent, NewsListBlocState> {
  final NewsRepository newsRepository;
  List<NewsItemList> allNews = [];
  List<NewsItemList> allNewsFiltered = [];
  bool isFetching = true;
  bool isSearching = false;
  int page = 0;

  NewsListBloc({required this.newsRepository})
      : super(const FetchingNewsListState()) {
    on<FetchNewsListEvent>(_fetchNewsList);
    on<FetchNewsListFromCategoryEvent>(_fetchNewsFromCategoryList);
    on<FilterNewsListEvent>(_filterNewsList);
  }

  void fetchNewsList(String baseUrl) => add(FetchNewsListEvent(baseUrl));
  void fetchNewsListFromCategory(String baseUrl, int newsCategoryId) =>
      add(FetchNewsListFromCategoryEvent(baseUrl, newsCategoryId));
  void filterNewsList(String searchText) =>
      add(FilterNewsListEvent(searchText));

  FutureOr<void> _fetchNewsList(FetchNewsListEvent fetchNewsListEvent,
      Emitter<NewsListBlocState> emit) async {
    emit(const FetchingNewsListState());
    try {
      final newsItemsList = await newsRepository.getNewsList(
          fetchNewsListEvent.baseUrl,
          pageIndex: page,
          pageSize: 20);
      if (newsItemsList.isNotEmpty) {
        allNews.addAll(newsItemsList);
        emit(FetchedNewsListState(allNews));
        page++;
      } else {
        emit(const NoNewsListState());
      }
    } catch (error) {
      emit(const ErrorNewsListState());
    }
  }

  FutureOr<void> _fetchNewsFromCategoryList(
      FetchNewsListFromCategoryEvent fetchNewsListEvent,
      Emitter<NewsListBlocState> emit) async {
    emit(const FetchingNewsListState());
    try {
      final newsItemsList = await newsRepository.getNewsListFromCategory(
        fetchNewsListEvent.baseUrl,
        categoryId: fetchNewsListEvent.newsCategoryId,
      );
      if (newsItemsList.isNotEmpty) {
        allNews.addAll(newsItemsList);
        emit(FetchedNewsListState(newsItemsList));
      } else {
        emit(const NoNewsListState());
      }
    } catch (error) {
      emit(const ErrorNewsListState());
    }
  }

  Future<void> _filterNewsList(
      FilterNewsListEvent event, Emitter<NewsListBlocState> emit) async {
    // Aggiorna la lista filtrata in base al testo di ricerca
    allNewsFiltered = event.searchText != ''
        ? allNews
            .where((newsItem) => newsItem.title
                .toLowerCase()
                .contains(event.searchText.toLowerCase()))
            .toList()
        : allNews;
    emit(FetchedNewsListState(allNewsFiltered));
  }
}
