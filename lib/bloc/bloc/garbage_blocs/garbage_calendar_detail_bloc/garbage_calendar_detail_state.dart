part of 'garbage_calendar_detail_bloc.dart';

abstract class GarbageDetailCalendarsState extends Equatable {
  const GarbageDetailCalendarsState();

  @override
  List<Object> get props => [];
}

class FetchingGarbageDetailCalendarsState extends GarbageDetailCalendarsState {
  const FetchingGarbageDetailCalendarsState();
}

class FetchedGarbageDetailCalendarsState extends GarbageDetailCalendarsState {
  final List<GarbageDetailCalendar> garbageDetailCalendarsList;
  const FetchedGarbageDetailCalendarsState(this.garbageDetailCalendarsList);

  @override
  List<Object> get props => [garbageDetailCalendarsList];
}

class NoGarbageDetailCalendarsState extends GarbageDetailCalendarsState {
  const NoGarbageDetailCalendarsState();
}

class ErrorGarbageDetailCalendarsState extends GarbageDetailCalendarsState {
  const ErrorGarbageDetailCalendarsState();
}
