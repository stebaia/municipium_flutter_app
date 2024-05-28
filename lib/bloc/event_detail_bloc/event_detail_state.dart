part of 'event_detail_bloc.dart';

abstract class EventDetailState extends Equatable {
  const EventDetailState();

  @override
  List<Object> get props => [];
}

class FetchingEventDetailState extends EventDetailState {
  const FetchingEventDetailState();
}

class FetchedEventDetailState extends EventDetailState {
  final EventDetail eventDetail;
  const FetchedEventDetailState(this.eventDetail);
  @override
  List<Object> get props => [eventDetail];

  get eventItemList => null;
}

class NoEventDetailState extends EventDetailState {
  const NoEventDetailState();
}

class ErrorEventDetailState extends EventDetailState {
  const ErrorEventDetailState();
}
