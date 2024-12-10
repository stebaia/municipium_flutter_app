part of 'garbage_calendar_element_bloc.dart';

abstract class GarbageCalendarElementState extends Equatable {
  const GarbageCalendarElementState();

  @override
  List<Object> get props => [];
}

class FetchingGarbageCalendarElementState extends GarbageCalendarElementState {
  const FetchingGarbageCalendarElementState();
}

class FetchedGarbageCalendarElementState extends GarbageCalendarElementState {
  final GarbageCalendarElement garbageCalendarElement;
  const FetchedGarbageCalendarElementState(this.garbageCalendarElement);

  @override
  List<Object> get props => [garbageCalendarElement];
}

class ErrorGarbageCalendarElementState extends GarbageCalendarElementState {
  const ErrorGarbageCalendarElementState();
}
