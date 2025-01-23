part of 'request_info_bloc.dart';

abstract class RequestInfoEvent extends Equatable {
  const RequestInfoEvent();

  @override
  List<Object> get props => [];
}

class UserRequestInfoEvent extends RequestInfoEvent {
  String baseUrl;
  String info;

  UserRequestInfoEvent({required this.baseUrl, required this.info});
}
