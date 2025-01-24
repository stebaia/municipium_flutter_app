part of 'ecoattivi_situazioneutente_bloc.dart';

abstract class EcoattiviSituazioneutenteEvent extends Equatable {
  const EcoattiviSituazioneutenteEvent();

  @override
  List<Object> get props => [];
}

class FetchEcoattiviSituazioneUtenteEvent
    extends EcoattiviSituazioneutenteEvent {
  final String baseUrl;
  final String token;
  final String guid;

  FetchEcoattiviSituazioneUtenteEvent(
      {required this.baseUrl, required this.token, required this.guid});

  @override
  List<Object> get props => [baseUrl, token, guid];
}
