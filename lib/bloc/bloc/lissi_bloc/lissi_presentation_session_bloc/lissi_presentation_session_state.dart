part of 'lissi_presentation_session_bloc.dart';

abstract class LissiPresentationSessionState extends Equatable {
  const LissiPresentationSessionState();

  @override
  List<Object> get props => [];
}

class CreatingPresentationSessionState extends LissiPresentationSessionState {
  const CreatingPresentationSessionState();
}

class ConfirmingPresentationSessionState extends LissiPresentationSessionState {
  const ConfirmingPresentationSessionState();
}

class CreatedPresentationSessionState extends LissiPresentationSessionState {
  final LissiPresentationSession presentationSession;
  
  const CreatedPresentationSessionState(this.presentationSession);

  @override
  List<Object> get props => [presentationSession];
}

class ConfirmedPresentationSessionState extends LissiPresentationSessionState {
  final LissiCardInfo presentationSession;
  
  const ConfirmedPresentationSessionState(this.presentationSession);

  @override
  List<Object> get props => [];
}

class ErrorPresentationSessionState extends LissiPresentationSessionState {
  const ErrorPresentationSessionState();
}


class ErrorConfirmingPresentationSessionState extends LissiPresentationSessionState {
  const ErrorConfirmingPresentationSessionState();
}
