part of 'info_municipality_bloc.dart';

abstract class InfoMunicipalityPageState extends Equatable {
  const InfoMunicipalityPageState();

  @override
  List<Object> get props => [];
}

class FetchingListPageInfoMunicipalityState extends InfoMunicipalityPageState {
  const FetchingListPageInfoMunicipalityState();
}

class FetchedListPageInfoMunicipalityState extends InfoMunicipalityPageState {
  final List<Pages> pageList;
  const FetchedListPageInfoMunicipalityState(this.pageList);

  @override
  List<Object> get props => [pageList];
}

class NoListPageInfoMunicipalityState extends InfoMunicipalityPageState {
  const NoListPageInfoMunicipalityState();
}

class ErrorListPageInfoMunicipalityState extends InfoMunicipalityPageState {
  const ErrorListPageInfoMunicipalityState();
}
