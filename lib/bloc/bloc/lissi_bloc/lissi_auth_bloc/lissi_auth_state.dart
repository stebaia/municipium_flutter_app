part of 'lissi_auth_bloc.dart';
abstract class LissiAuthState extends Equatable {
  const LissiAuthState();

  @override
  List<Object> get props => [];
}

class FetchingLissiTokenState extends LissiAuthState {
  const FetchingLissiTokenState();
}

class FetchedLissiTokenState extends LissiAuthState {
  final String token;
  const FetchedLissiTokenState(this.token);

  @override
  List<Object> get props => [token];
}

class ErrorLissiTokenState extends LissiAuthState {
  const ErrorLissiTokenState();
}
