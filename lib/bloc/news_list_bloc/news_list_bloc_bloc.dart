import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/news_item_list.dart';
import 'package:municipium/repositories/news_repository.dart';

part 'news_list_bloc_event.dart';
part 'news_list_bloc_state.dart';

class NewsListBloc extends Bloc<NewsListBlocEvent, NewsListBlocState> {

  final NewsRepository newsRepository;

  NewsListBloc({required this.newsRepository}) : super(const FetchingNewsListState()) {
    on<FetchNewsListEvent>(_fetchNewsList);
  }

  void fetchNewsList() =>
      add(const FetchNewsListEvent());

  FutureOr<void> _fetchNewsList(
    FetchNewsListEvent fetchNewsListEvent,
    Emitter<NewsListBlocState> emit) async{
      emit(const FetchingNewsListState());
      try{
        final newsItemsList = await newsRepository.getNewsList();
        if(newsItemsList.isNotEmpty){
emit(FetchedNewsListState(newsItemsList));
        }else{
          emit(const NoNewsListState());
        }
        
      }catch(error){
        emit(const ErrorNewsListState());
      }
    }
  
}
