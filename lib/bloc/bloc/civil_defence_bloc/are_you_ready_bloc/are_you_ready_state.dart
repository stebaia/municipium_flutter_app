part of 'are_you_ready_bloc.dart';

abstract class AreYouReadyState extends Equatable {
  const AreYouReadyState();

  @override
  List<Object> get props => [];
}

class FetchingAreYouReadyState extends AreYouReadyState {
  const FetchingAreYouReadyState();
}

class FetchedAreYouReadyStateState extends AreYouReadyState {
  final List<CivilDefenceAreYouReady> civilDefenceAreYouReady;
  const FetchedAreYouReadyStateState(this.civilDefenceAreYouReady);

  @override
  List<Object> get props => [civilDefenceAreYouReady];
}

class ErrorAreYouReadyStateState extends AreYouReadyState {
  const ErrorAreYouReadyStateState();
}
