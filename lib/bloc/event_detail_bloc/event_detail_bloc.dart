import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/events/event_detail.dart';
import 'package:municipium/repositories/events_repository.dart';
part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBLoc extends Bloc<EventDetailEvent, EventDetailState> {
  final EventsRepository eventRepository;
  EventDetailBLoc({required this.eventRepository})
      : super(const FetchingEventDetailState()) {
    on<FetchEventDetailEvent>(_fetchEventDetail);
  }

  void fetchEventDetail(int eventId) =>
      add(FetchEventDetailEvent(eventId: eventId));

  FutureOr<void> _fetchEventDetail(FetchEventDetailEvent fetchEventDetailEvent,
      Emitter<EventDetailState> emit) async {
    emit(const FetchingEventDetailState());
    try {
      final newsDetail = await eventRepository.getEventDetail(
          id: fetchEventDetailEvent.eventId);
      emit(FetchedEventDetailState(newsDetail));
    } catch (error) {
      emit(const ErrorEventDetailState());
    }
  }
}
