import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_message.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

part 'ecoattivi_message_event.dart';
part 'ecoattivi_message_state.dart';

class EcoattiviMessageBloc
    extends Bloc<EcoattiviMessageEvent, EcoattiviMessageState> {
  final EcoattiviRepository ecoattiviRepository;

  EcoattiviMessageBloc({required this.ecoattiviRepository})
      : super(const FetchingEcoattiviMessageState()) {
    on<FetchEcoattiviMessageEvent>(_fetchEcoattiviMessageList);
  }

  void fetchMessages(String baseUrl, String token, String guid) => add(
      FetchEcoattiviMessageEvent(baseUrl: baseUrl, token: token, guid: guid));

  FutureOr<void> _fetchEcoattiviMessageList(
      FetchEcoattiviMessageEvent fetchMessageEvent,
      Emitter<EcoattiviMessageState> emit) async {
    emit(const FetchingEcoattiviMessageState());
    try {
      final issueDetail = await ecoattiviRepository.getMessages(
          baseUrl: fetchMessageEvent.baseUrl,
          token: fetchMessageEvent.token,
          guid: fetchMessageEvent.guid);
      if (issueDetail != null) {
        emit(FetchedEcoattiviMessageState(issueDetail));
      } else {
        emit(NoEcoattiviMessageState());
      }
    } catch (error) {
      emit(const ErrorEcoattiviMessageState());
    }
  }
}
