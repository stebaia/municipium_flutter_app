import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/repositories/calendar_event_repository.dart';

part 'calendar_event_bloc_event.dart';
part 'calendar_event_bloc_state.dart';

class CalendarBloc extends Bloc<CalendarEventBlocEvent, CalendarEventBlocState> {

  final CalendarEventRepository calendarEventRepository;

  CalendarBloc({required this.calendarEventRepository}) : super(TryCalendarState()) {
    on<FetchCalendarEvent>(_fetchCalendarEvents);
  }

  void fetchCalendarEvents(DateTime date) => add(FetchCalendarEvent(date: date));

  FutureOr<void> _fetchCalendarEvents(FetchCalendarEvent event, Emitter<CalendarEventBlocState> emit) async {
    emit(TryCalendarState());
    try {
      final calendar = await calendarEventRepository.getCalendarEvents(event.date);
      emit(FetchedCalendarState(calendar: calendar));
    } catch (e) {
      emit(ErrorCalendarState());
    }
  }
}
