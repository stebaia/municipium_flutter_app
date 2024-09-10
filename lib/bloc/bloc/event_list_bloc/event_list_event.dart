part of 'event_list_bloc.dart';

abstract class EventListEvent extends Equatable {
  const EventListEvent();

  @override
  List<Object> get props => [];
}

class FetchEventListEvent extends EventListEvent {
  const FetchEventListEvent();
  @override
  List<Object> get props => [];
}

class FilterEventListEvent extends EventListEvent {
  final String searchText;

  const FilterEventListEvent(this.searchText);
  @override
  List<Object> get props => [searchText];
}
