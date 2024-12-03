import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_wrapper.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

//lo uso per salvare la situazioneUtente e le varie necessità della ssezione ecoattivi tra cui il token
class EcoattiviUserCubit extends Cubit<EcoattiviWrapper> {
  EcoattiviUserCubit() : super(EcoattiviWrapper());

  void setToken(String token) {
    final ecoattiviModel = state.copyWith(token: token);
    emit(ecoattiviModel);
  }

  void setSituazioneUtente(EcoattiviSituazioneUtente situazioneUtente) {
    final ecoattiviModel = state.copyWith(situazioneUtente: situazioneUtente);
    emit(ecoattiviModel);
  }
}
