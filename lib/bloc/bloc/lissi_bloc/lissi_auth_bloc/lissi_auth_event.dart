part of 'lissi_auth_bloc.dart';

abstract class LissiAuthEvent extends Equatable {
  const LissiAuthEvent();

  @override
  List<Object> get props => [];
}

class FetchLissiTokenEvent extends LissiAuthEvent {
  const FetchLissiTokenEvent();
}