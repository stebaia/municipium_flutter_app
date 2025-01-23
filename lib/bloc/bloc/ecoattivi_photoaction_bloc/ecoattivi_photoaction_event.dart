part of 'ecoattivi_photoaction_bloc.dart';

abstract class EcoattiviPhotoActionEvent extends Equatable {
  const EcoattiviPhotoActionEvent();

  @override
  List<Object> get props => [];
}

class FetchEcoattiviPhotoActionEvent extends EcoattiviPhotoActionEvent {
  final String baseUrl;
  final String token;
  final String guid;
  const FetchEcoattiviPhotoActionEvent(this.baseUrl, this.token, this.guid);

  @override
  List<Object> get props => [baseUrl];
}
