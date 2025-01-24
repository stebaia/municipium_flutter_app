part of 'ecoattivi_missions_bloc.dart';

abstract class EcoattiviMissionsEvent extends Equatable {
  const EcoattiviMissionsEvent();

  @override
  List<Object> get props => [];
}

class FetchEcoattiviMissionsListEvent extends EcoattiviMissionsEvent {
  String baseUrl;
  String token;
  String guid;

  FetchEcoattiviMissionsListEvent(
      {required this.baseUrl, required this.token, required this.guid});
}
