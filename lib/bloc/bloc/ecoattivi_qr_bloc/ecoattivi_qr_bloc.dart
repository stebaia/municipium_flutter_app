import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_qr_body.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_qr_response.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

part 'ecoattivi_qr_event.dart';
part 'ecoattivi_qr_state.dart';

class EcoattiviQrBloc extends Bloc<EcoattiviQrEvent, EcoattiviQrState> {
  final EcoattiviRepository ecoattiviRepository;

  EcoattiviQrBloc({required this.ecoattiviRepository})
      : super(EcoattiviQrInitial()) {
    on<ScanEcoattiviQrEvent>(_registration);
  }

  void registrationQr(
          String baseUrl, String token, String guid, EcoattiviQrBody body) =>
      add(ScanEcoattiviQrEvent(
          baseUrl: baseUrl, token: token, guid: guid, body: body));

  FutureOr<void> _registration(
      ScanEcoattiviQrEvent event, Emitter<EcoattiviQrState> emit) async {
    emit(EcoattiviQrLoading());
    try {
      final response = await ecoattiviRepository.qrRegistration(
          baseUrl: event.baseUrl,
          token: event.token,
          guid: event.guid,
          body: event.body);
      emit(EcoattiviQrSuccess(response));
    } catch (error) {
      emit(EcoattiviQrFailure(error.toString()));
    }
  }
}
