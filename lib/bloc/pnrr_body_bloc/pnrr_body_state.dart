part of 'pnrr_body_bloc.dart';

abstract class PnrrBodyState extends Equatable {
  const PnrrBodyState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchingPnrrBodyState extends PnrrBodyState {
  const FetchingPnrrBodyState();
}

class FetchedPnrrBodyState extends PnrrBodyState {
  final BodyPnrrResponse response;
  const FetchedPnrrBodyState(this.response);
  @override
  List<Object> get props => [response];
}

class NoPnrrBodyState extends PnrrBodyState {
  const NoPnrrBodyState();
}

class ErrorPnrrBodyState extends PnrrBodyState {
  const ErrorPnrrBodyState();
}
