import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/lissi/lissi_card_info.dart';
import 'package:municipium/model/lissi/lissi_presentation_template_info.dart';
import 'package:municipium/model/lissi/presentation_session.dart';
import 'package:municipium/repositories/lissi_repository.dart';

part 'lissi_presentation_session_event.dart';
part 'lissi_presentation_session_state.dart';

class LissiPresentationSessionBloc 
    extends Bloc<LissiPresentationSessionEvent, LissiPresentationSessionState> {
  final LissiRepository lissiRepository;

  LissiPresentationSessionBloc({required this.lissiRepository}) 
      : super(const CreatingPresentationSessionState()) {
    on<CreatePresentationSessionEvent>(_createPresentationSession);
    on<ConfirmPresentationSessionEvent>(_confirmPresentationSession);
  }

  void createPresentationSession(LissiPresentationTemplateInfo templateInfo) => 
      add(CreatePresentationSessionEvent(templateInfo));

  void confirmPresentationSession(String presentationId) => 
      add(ConfirmPresentationSessionEvent(presentationId));

  FutureOr<void> _createPresentationSession(
    CreatePresentationSessionEvent event, 
    Emitter<LissiPresentationSessionState> emit
  ) async {
    emit(const CreatingPresentationSessionState());
    try {
      final presentationSession = await lissiRepository.getPresentationSession(event.presentationTemplateInfo);
      emit(CreatedPresentationSessionState(presentationSession));
    } catch (error) {
      emit(const ErrorPresentationSessionState());
    }
  }


  FutureOr<void> _confirmPresentationSession(
    ConfirmPresentationSessionEvent event, 
    Emitter<LissiPresentationSessionState> emit
  ) async {
    emit(const ConfirmingPresentationSessionState());
    try {
      final presentationSession = await lissiRepository.confirmPresentationSession(event.presentationSessionId);
      if(presentationSession.state == 'COMPLETE') {
        emit(ConfirmedPresentationSessionState(presentationSession));
      } else if(presentationSession.state == 'ERROR') {
        emit(const ErrorConfirmingPresentationSessionState());
      } 
    } catch (error) {
      emit(const ErrorConfirmingPresentationSessionState());
    }
  }
}
