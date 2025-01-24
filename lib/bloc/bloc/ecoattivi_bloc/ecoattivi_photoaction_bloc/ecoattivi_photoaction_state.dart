part of 'ecoattivi_photoaction_bloc.dart';

abstract class EcoattiviPhotoActionState extends Equatable {
  const EcoattiviPhotoActionState();

  @override
  List<Object> get props => [];
}

class FetchingEcoattiviPhotoActionState extends EcoattiviPhotoActionState {
  const FetchingEcoattiviPhotoActionState();
}

class FetchedEcoattiviPhotoActionState extends EcoattiviPhotoActionState {
  final List<EcoattiviFotoAzione> photoActionList;
  const FetchedEcoattiviPhotoActionState(this.photoActionList);

  @override
  List<Object> get props => [photoActionList];
}

class NoEcoattiviPhotoActionState extends EcoattiviPhotoActionState {
  const NoEcoattiviPhotoActionState();
}

class ErrorEcoattiviPhotoActionState extends EcoattiviPhotoActionState {
  const ErrorEcoattiviPhotoActionState();
}
