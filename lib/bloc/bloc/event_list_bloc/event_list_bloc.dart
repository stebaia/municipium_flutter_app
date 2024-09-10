import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/events/event_item_list.dart';
import 'package:municipium/repositories/events_repository.dart';

part 'event_list_event.dart';
part 'event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  final EventsRepository eventsRepository;
  int page = 1;
  bool isFetching = true;
  bool isSearching = false;
  List<EventItemList> allEvents = [];
  List<EventItemList> allEventsFiltered = [];

  EventListBloc({required this.eventsRepository})
      : super(const FetchingEventListState()) {
    on<FetchEventListEvent>(_fetchEventList);
    on<FilterEventListEvent>(_filterEventsList);
  }

  void fetchEventList() => add(const FetchEventListEvent());
  void filterEventList(String searchText) =>
      add(FilterEventListEvent(searchText));

  FutureOr<void> _fetchEventList(FetchEventListEvent fetchEventListEvent,
      Emitter<EventListState> emit) async {
    emit(const FetchingEventListState());
    try {
      final eventItemList =
          await eventsRepository.getEventsList(pageIndex: page, pageSize: 20);
      if (eventItemList.isNotEmpty) {
        allEvents.addAll(eventItemList);
        emit(FetchedEventListState(allEvents));
        page++;
      } else {
        emit(const NoEventListState());
      }
    } catch (error) {
      emit(const ErrorEventListState());
    }
  }

  Future<void> _filterEventsList(
      FilterEventListEvent event, Emitter<EventListState> emit) async {
    // Aggiorna la lista filtrata in base al testo di ricerca
    allEventsFiltered = event.searchText != ''
        ? allEvents
            .where((newsItem) => newsItem.title
                .toLowerCase()
                .contains(event.searchText.toLowerCase()))
            .toList()
        : allEvents;
    emit(FetchedEventListState(allEventsFiltered));
  }
}
