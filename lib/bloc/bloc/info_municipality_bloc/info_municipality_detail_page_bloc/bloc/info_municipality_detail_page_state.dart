part of 'info_municipality_detail_page_bloc.dart';

abstract class InfoMunicipalityState extends Equatable {
  const InfoMunicipalityState();

  @override
  List<Object> get props => [];
}

class FetchingInfoMunicipalityState extends InfoMunicipalityState {
  const FetchingInfoMunicipalityState();
}

class FetchedInfoMunicipalityState extends InfoMunicipalityState {
  final Pages pageDetail;
  const FetchedInfoMunicipalityState(this.pageDetail);

  @override
  List<Object> get props => [pageDetail];
}

class NoInfoMunicipalityState extends InfoMunicipalityState {
  const NoInfoMunicipalityState();
}

class ErrorInfoMunicipalityState extends InfoMunicipalityState {
  const ErrorInfoMunicipalityState();
}
