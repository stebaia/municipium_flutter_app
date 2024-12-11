part of 'lissi_presentation_template_bloc.dart';


abstract class PresentationTemplatesEvent extends Equatable {
  const PresentationTemplatesEvent();

  @override
  List<Object> get props => [];
}

class FetchPresentationTemplatesEvent extends PresentationTemplatesEvent {
  const FetchPresentationTemplatesEvent();
}