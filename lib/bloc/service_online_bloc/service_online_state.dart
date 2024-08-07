part of 'service_online_bloc.dart';

sealed class ServiceOnlineState extends Equatable {
  const ServiceOnlineState();
  
  @override
  List<Object> get props => [];
}

final class TryServiceOnlineState extends ServiceOnlineState {
  const TryServiceOnlineState();
  @override
  List<Object> get props => [];
}


final class FetchedServiceOnlineState extends ServiceOnlineState {

  final List<OnlineService> onlineServiceList;

  const FetchedServiceOnlineState(this.onlineServiceList);
  @override
  List<Object> get props => [onlineServiceList];
}

final class ErrorServiceOnlineState extends ServiceOnlineState {
  const ErrorServiceOnlineState();
  @override
  List<Object> get props => [];
}

final class NoServiceOnlineState extends ServiceOnlineState {
  const NoServiceOnlineState();
  @override
  List<Object> get props => [];
}