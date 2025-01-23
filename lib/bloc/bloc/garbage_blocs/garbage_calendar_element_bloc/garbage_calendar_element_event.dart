part of 'garbage_calendar_element_bloc.dart';

abstract class GarbageCalendarElementEvent extends Equatable {
  const GarbageCalendarElementEvent();

  @override
  List<Object> get props => [];
}

class FetchGarbageCalendarElementEvent extends GarbageCalendarElementEvent {
  final String baseUrl;
  final int id;
  const FetchGarbageCalendarElementEvent(this.baseUrl, this.id);

  @override
  List<Object> get props => [baseUrl, id];
}