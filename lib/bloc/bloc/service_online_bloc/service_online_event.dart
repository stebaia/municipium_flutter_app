part of 'service_online_bloc.dart';

abstract class ServiceOnlineEvent extends Equatable {
  const ServiceOnlineEvent();

  @override
  List<Object> get props => [];
}

class FetchServiceListEvent extends ServiceOnlineEvent {
  String baseUrl;
  FetchServiceListEvent(this.baseUrl);

  @override
  List<Object> get props => [];
}

class FilterServiceListEvent extends ServiceOnlineEvent {
  final String query;

  const FilterServiceListEvent(this.query);

  @override
  List<Object> get props => [query];
}
