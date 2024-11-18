part of 'event_list_bloc.dart';

abstract class EventListEvent extends Equatable {
  const EventListEvent();

  @override
  List<Object> get props => [];
}

class FetchEventListEvent extends EventListEvent {
  String baseUrl;
  FetchEventListEvent(this.baseUrl);
  @override
  List<Object> get props => [baseUrl];
}

class FilterEventListEvent extends EventListEvent {
  final String searchText;
  FilterEventListEvent(this.searchText);
  @override
  List<Object> get props => [searchText];
}
