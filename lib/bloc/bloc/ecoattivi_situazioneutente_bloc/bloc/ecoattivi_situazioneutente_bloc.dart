import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';
import 'package:municipium/services/network/dto/response_dto.dart';

part 'ecoattivi_situazioneutente_bloc_event.dart';
part 'ecoattivi_situazioneutente_bloc_state.dart';

class EcoattiviSituazioneutenteBloc extends Bloc<EcoattiviSituazioneutenteEvent,
    EcoattiviSituazioneutenteState> {
  final EcoattiviRepository ecoattiviRepository;
  EcoattiviSituazioneutenteBloc({required this.ecoattiviRepository})
      : super(FetchingEcoattiviSituazioneUtenteState()) {
    on<FetchEcoattiviSituazioneUtenteEvent>(_fetchSituazioneUtente);
  }

  void fetchSituazioneUtente(String baseUrl, String token, String guid) =>
      add(FetchEcoattiviSituazioneUtenteEvent(
          baseUrl: baseUrl, token: token, guid: guid));

  FutureOr<void> _fetchSituazioneUtente(
      FetchEcoattiviSituazioneUtenteEvent fetchEcoattiviSituazioneUtenteEvent,
      Emitter<EcoattiviSituazioneutenteState> emit) async {
    emit(const FetchingEcoattiviSituazioneUtenteState());
    try {
      final situazioneUtente = await ecoattiviRepository.getSituazioneUtente(
          fetchEcoattiviSituazioneUtenteEvent.baseUrl,
          fetchEcoattiviSituazioneUtenteEvent.token,
          fetchEcoattiviSituazioneUtenteEvent.guid);
      if (situazioneUtente != null) {
        emit(FetchedEcoattiviSituazioneUtenteState(situazioneUtente));
      } else {
        emit(const ErrorEcoattiviSituazioneUtenteState());
      }
    } catch (error) {
      emit(const ErrorEcoattiviSituazioneUtenteState());
    }
  }
}
