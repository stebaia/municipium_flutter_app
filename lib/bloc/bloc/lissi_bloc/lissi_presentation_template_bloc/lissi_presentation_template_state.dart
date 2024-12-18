part of 'lissi_presentation_template_bloc.dart';

abstract class PresentationTemplatesState extends Equatable {
  const PresentationTemplatesState();

  @override
  List<Object> get props => [];
}

class FetchingPresentationTemplatesState extends PresentationTemplatesState {
  const FetchingPresentationTemplatesState();
}

class FetchedPresentationTemplatesState extends PresentationTemplatesState {
  final List<PrestenationLissiTemplateContent> presentationTemplates;
  const FetchedPresentationTemplatesState(this.presentationTemplates);

  @override
  List<Object> get props => [presentationTemplates];
}

class NoPresentationTemplatesState extends PresentationTemplatesState {
  const NoPresentationTemplatesState();
}

class ErrorPresentationTemplatesState extends PresentationTemplatesState {
  const ErrorPresentationTemplatesState();
}