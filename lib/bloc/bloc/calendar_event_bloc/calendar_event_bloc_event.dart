part of 'calendar_event_bloc_bloc.dart';

sealed class CalendarEventBlocEvent extends Equatable {
  const CalendarEventBlocEvent();

  @override
  List<Object> get props => [];
}

final class FetchCalendarEvent extends CalendarEventBlocEvent {
  final String date;
  final String? endDate;
  final String? type;
  final String? name;

  const FetchCalendarEvent({required this.date,  this.endDate, this.name, this.type});

  @override
  List<Object> get props => [date];
}

