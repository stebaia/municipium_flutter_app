part of 'calendar_event_bloc_bloc.dart';

sealed class CalendarEventBlocEvent extends Equatable {
  const CalendarEventBlocEvent();

  @override
  List<Object> get props => [];
}

final class FetchCalendarEvent extends CalendarEventBlocEvent {
  final DateTime date;

  const FetchCalendarEvent({required this.date});

  @override
  List<Object> get props => [date];
}

