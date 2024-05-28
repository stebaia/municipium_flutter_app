import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/event_item_list.dart';
import 'package:municipium/repositories/events_repository.dart';

part 'event_list_event.dart';
part 'event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  final EventsRepository eventsRepository;
  int page = 1;
  bool isFetching = true;

  EventListBloc({required this.eventsRepository})
      : super(const FetchingEventListState()) {
    on<FetchEventListEvent>(_fetchEventList);
  }

  void fetchEventList() => add(const FetchEventListEvent());



  FutureOr<void> _fetchEventList(
      FetchEventListEvent fetchEventListEvent,
      Emitter<EventListState> emit) async {
    emit(const FetchingEventListState());
    try {
      final eventItemList =
          await eventsRepository.getEventsList(
              pageIndex: page,
              pageSize: 20);
      if (eventItemList.isNotEmpty){
        emit(FetchedEventListState(eventItemList));
        page++;
      }else {
        emit(const NoEventListState());
      }    
    } catch (error) {
      emit(const ErrorEventListState());
    }
  }
}
