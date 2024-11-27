part of 'civil_defence_info_bloc.dart';

abstract class CivilDefenceInformationsEvent extends Equatable {
  const CivilDefenceInformationsEvent();

  @override
  List<Object> get props => [];
}

class FetchCivilDefenceInformationsEvent extends CivilDefenceInformationsEvent {
  final String baseUrl;
  const FetchCivilDefenceInformationsEvent(this.baseUrl);

  @override
  List<Object> get props => [baseUrl];
}