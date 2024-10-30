part of 'pnrr_services_bloc.dart';

abstract class PnrrServiceEvent extends Equatable {
  const PnrrServiceEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchPnrrServiceEvent extends PnrrServiceEvent {
  FetchPnrrServiceEvent({required this.baseUrl, required this.type});
  String baseUrl;
  final String type;
  @override
  List<Object> get props => [baseUrl];
}

class FilterPnrrServiceEvent extends PnrrServiceEvent {
  final String searchText;

  const FilterPnrrServiceEvent(this.searchText);
  @override
  List<Object> get props => [searchText];
}
