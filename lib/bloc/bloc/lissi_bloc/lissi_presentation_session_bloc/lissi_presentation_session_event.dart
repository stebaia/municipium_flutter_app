part of 'lissi_presentation_session_bloc.dart';

abstract class LissiPresentationSessionEvent extends Equatable {
  const LissiPresentationSessionEvent();

  @override
  List<Object> get props => [];
}

class CreatePresentationSessionEvent extends LissiPresentationSessionEvent {
  final LissiPresentationTemplateInfo presentationTemplateInfo;
  
  const CreatePresentationSessionEvent(this.presentationTemplateInfo);

  @override
  List<Object> get props => [presentationTemplateInfo];
}


class ConfirmPresentationSessionEvent extends LissiPresentationSessionEvent {
  final String presentationSessionId;
  
  const ConfirmPresentationSessionEvent(this.presentationSessionId);

  @override
  List<Object> get props => [presentationSessionId];
}