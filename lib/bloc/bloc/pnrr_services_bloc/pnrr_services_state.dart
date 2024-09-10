part of 'pnrr_services_bloc.dart';

abstract class PnrrServiceState extends Equatable {
  const PnrrServiceState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchingPnrrServiceState extends PnrrServiceState {
  const FetchingPnrrServiceState();
}

class FetchedPnrrServiceState extends PnrrServiceState {
  final List<ServicePnrr> servicesList;
  const FetchedPnrrServiceState(this.servicesList);
  @override
  List<Object> get props => [servicesList];
}

class NoPnrrServiceState extends PnrrServiceState {
  const NoPnrrServiceState();
}

class ErrorPnrrServiceState extends PnrrServiceState {
  const ErrorPnrrServiceState();
}
