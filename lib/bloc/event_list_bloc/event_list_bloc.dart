import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/event_item_list.dart';
import 'package:municipium/repositories/events_repository.dart';

part 'event_list_event.dart';
part 'event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  final EventsRepository newsRepository;

  EventListBloc({required this.newsRepository})
      : super(const FetchingEventListState()) {
    on<FetchEventListEvent>(_fetchEventList);
  }

  FutureOr<void> _fetchEventList(FetchEventListEvent fetchNewsListEvent,
      Emitter<EventListState> emit) async {
    emit(const FetchingEventListState());
    try {
      final newsItemsList = await newsRepository.getEventsList();
      if (newsItemsList.isNotEmpty) {
        emit(FetchedEventListState(newsItemsList));
      } else {
        emit(const NoEventListState());
      }
    } catch (error) {
      emit(const ErrorEventListState());
    }
  }
}
