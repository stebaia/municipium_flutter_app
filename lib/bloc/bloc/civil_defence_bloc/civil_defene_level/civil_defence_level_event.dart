part of 'civil_defence_level_bloc.dart';

abstract class CivilDefenceLevelsEvent extends Equatable {
  const CivilDefenceLevelsEvent();

  @override
  List<Object> get props => [];
}

class FetchCivilDefenceLevelsEvent extends CivilDefenceLevelsEvent {
  final String baseUrl;
  final String type;
  const FetchCivilDefenceLevelsEvent(this.baseUrl, this.type);

  @override
  List<Object> get props => [baseUrl, type];
}
