part of 'calendar_event_bloc_bloc.dart';

sealed class CalendarEventBlocState extends Equatable {
  const CalendarEventBlocState();
  
  @override
  List<Object> get props => [];
}

final class TryCalendarState extends CalendarEventBlocState {}

final class FetchedCalendarState extends CalendarEventBlocState {
  final List<Calendar> calendar;

  const FetchedCalendarState({required this.calendar});

  @override
  List<Object> get props => [calendar];
}

final class ErrorCalendarState extends CalendarEventBlocState {}



