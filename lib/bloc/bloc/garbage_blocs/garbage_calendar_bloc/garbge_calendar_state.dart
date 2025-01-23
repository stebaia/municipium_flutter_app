part of 'garbge_calendar_bloc.dart';

abstract class GarbageCalendarsState extends Equatable {
  const GarbageCalendarsState();

  @override
  List<Object> get props => [];
}

class FetchingGarbageCalendarsState extends GarbageCalendarsState {
  const FetchingGarbageCalendarsState();
}

class FetchedGarbageCalendarsState extends GarbageCalendarsState {
  final List<GarbageCalendars> garbageCalendarsList;
  const FetchedGarbageCalendarsState(this.garbageCalendarsList);

  @override
  List<Object> get props => [garbageCalendarsList];
}

class NoGarbageCalendarsState extends GarbageCalendarsState {
  const NoGarbageCalendarsState();
}

class ErrorGarbageCalendarsState extends GarbageCalendarsState {
  const ErrorGarbageCalendarsState();
}
