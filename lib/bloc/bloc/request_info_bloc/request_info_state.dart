part of 'request_info_bloc.dart';

abstract class RequestInfoState extends Equatable {
  const RequestInfoState();

  @override
  List<Object> get props => [];
}

class FetchingInfoState extends RequestInfoState {
  const FetchingInfoState();
}

class FetchedInfoState extends RequestInfoState {
  final String description;

  const FetchedInfoState(this.description);
}

class ErrorFetchedInfoState extends RequestInfoState {
  final String message;

  const ErrorFetchedInfoState(this.message);
}
