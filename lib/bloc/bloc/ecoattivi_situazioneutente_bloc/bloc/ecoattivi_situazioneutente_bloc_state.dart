part of 'ecoattivi_situazioneutente_bloc.dart';

abstract class EcoattiviSituazioneutenteState extends Equatable {
  const EcoattiviSituazioneutenteState();

  @override
  List<Object> get props => [];
}

class FetchingEcoattiviSituazioneUtenteState
    extends EcoattiviSituazioneutenteState {
  const FetchingEcoattiviSituazioneUtenteState();
}

class FetchedEcoattiviSituazioneUtenteState
    extends EcoattiviSituazioneutenteState {
  final EcoattiviSituazioneUtente situazioneUtente;
  const FetchedEcoattiviSituazioneUtenteState(this.situazioneUtente);

  @override
  List<Object> get props => [situazioneUtente];
}

class NoEcoattiviSituazioneUtenteState extends EcoattiviSituazioneutenteState {
  const NoEcoattiviSituazioneUtenteState();
}

class ErrorEcoattiviSituazioneUtenteState
    extends EcoattiviSituazioneutenteState {
  const ErrorEcoattiviSituazioneUtenteState();

  @override
  List<Object> get props => [];
}
