part of 'event_detail_bloc.dart';

abstract class EventDetailEvent extends Equatable {
  const EventDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchEventDetailEvent extends EventDetailEvent {
  final int eventId;

  const FetchEventDetailEvent({required this.eventId});
  @override
  List<Object> get props => [eventId];
}
