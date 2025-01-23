part of 'ecostop_bloc.dart';

abstract class EcostopEvent extends Equatable {
  const EcostopEvent();

  @override
  List<Object> get props => [];
}

class FetchEcostopEvent extends EcostopEvent {
  final String baseUrl;
  final String token;
  final String guid;

  FetchEcostopEvent(this.baseUrl, this.token, this.guid);

  @override
  List<Object> get props => [baseUrl];
}

class FilterEcostopEvent extends EcostopEvent {
  final String searchText;

  FilterEcostopEvent(this.searchText);

  @override
  List<Object> get props => [searchText];
}
