part of 'event_list_bloc.dart';

abstract class EventListState extends Equatable {
  const EventListState();

  @override
  List<Object> get props => [];
}

class FetchingNewsListState extends EventListState {
  const FetchingNewsListState();
}

class FetchedNewsListState extends EventListState {
  final List<EventItemList> newsItemList;
  const FetchedNewsListState(this.newsItemList);
  @override
  List<Object> get props => [newsItemList];
}

class NoNewsListState extends EventListState {
  const NoNewsListState();
}

class ErrorNewsListState extends EventListState {
  const ErrorNewsListState();
}
