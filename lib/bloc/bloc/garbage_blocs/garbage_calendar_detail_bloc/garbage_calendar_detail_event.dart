part of 'garbage_calendar_detail_bloc.dart';


abstract class GarbageDetailCalendarsEvent extends Equatable {
  const GarbageDetailCalendarsEvent();

  @override
  List<Object> get props => [];
}

class FetchGarbageDetailCalendarsEvent extends GarbageDetailCalendarsEvent {
  final String baseUrl;
  final String id;
  final String start;
  final String end;
  const FetchGarbageDetailCalendarsEvent(this.baseUrl, this.id, this.start, this.end);

  @override
  List<Object> get props => [baseUrl, id, start, end];
}