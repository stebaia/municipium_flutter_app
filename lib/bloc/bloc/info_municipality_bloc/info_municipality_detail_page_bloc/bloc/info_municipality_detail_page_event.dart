part of 'info_municipality_detail_page_bloc.dart';

abstract class InfoMunicipalityEvent extends Equatable {
  const InfoMunicipalityEvent();

  @override
  List<Object> get props => [];
}

class FetchInfoMunicipalityEvent extends InfoMunicipalityEvent {
  final String baseUrl;
  final int id;

  const FetchInfoMunicipalityEvent({
    required this.baseUrl,
    required this.id,
  });

  @override
  List<Object> get props => [baseUrl, id];
}