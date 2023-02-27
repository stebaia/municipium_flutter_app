part of 'municipality_bloc.dart';

abstract class MunicipalityEvent extends Equatable {
  const MunicipalityEvent();

  @override
  List<Object> get props => [];
}

class FetchMunicipalityEvent extends MunicipalityEvent {
  final int municipalityId;
  const FetchMunicipalityEvent({required this.municipalityId});
   @override
  List<Object> get props => [municipalityId];
}


