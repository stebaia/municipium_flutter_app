part of 'event_list_bloc.dart';

abstract class EventListState extends Equatable {
  const EventListState();

  @override
  List<Object> get props => [];
}

class FetchingEventListState extends EventListState {
  const FetchingEventListState();
}

class FetchedEventListState extends EventListState {
  final List<EventItemList> newsItemList;
  const FetchedEventListState(this.newsItemList);
  @override
  List<Object> get props => [newsItemList];
}

class NoEventListState extends EventListState {
  const NoEventListState();
}

class ErrorEventListState extends EventListState {
  const ErrorEventListState();
}
