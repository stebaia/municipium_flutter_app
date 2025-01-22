part of 'info_municipality_bloc.dart';

abstract class InfoMunicipalityPageEvent extends Equatable {
  const InfoMunicipalityPageEvent();

  @override
  List<Object> get props => [];
}

class FetchInfoMunicipalityPageEvent extends InfoMunicipalityPageEvent {
  final String baseUrl;


  const FetchInfoMunicipalityPageEvent({
    required this.baseUrl,

  });

  @override
  List<Object> get props => [baseUrl,];
}