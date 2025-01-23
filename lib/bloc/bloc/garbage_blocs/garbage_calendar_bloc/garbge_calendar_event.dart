part of 'garbge_calendar_bloc.dart';


abstract class GarbageCalendarsEvent extends Equatable {
  const GarbageCalendarsEvent();

  @override
  List<Object> get props => [];
}

class FetchGarbageCalendarsEvent extends GarbageCalendarsEvent {
  final String baseUrl;
  const FetchGarbageCalendarsEvent(this.baseUrl,);

  @override
  List<Object> get props => [baseUrl,];
}

