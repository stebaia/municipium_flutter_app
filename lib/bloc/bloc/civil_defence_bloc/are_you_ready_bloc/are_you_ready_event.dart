part of 'are_you_ready_bloc.dart';

abstract class AreYouReadyEvent extends Equatable {
  const AreYouReadyEvent();

  @override
  List<Object> get props => [];
}

class FetchAreYouReadyEvent extends AreYouReadyEvent {
  final String baseUrl;
  const FetchAreYouReadyEvent(
    this.baseUrl,
  );

  @override
  List<Object> get props => [
        baseUrl,
      ];
}
