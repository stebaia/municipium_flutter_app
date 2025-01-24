import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_foto_azione.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

part 'ecoattivi_photoaction_event.dart';
part 'ecoattivi_photoaction_state.dart';

class EcoattiviPhotoActionBloc
    extends Bloc<EcoattiviPhotoActionEvent, EcoattiviPhotoActionState> {
  final EcoattiviRepository ecoattiviRepository;
  int page = 1;
  bool isFetching = true;
  bool isSearching = false;

  EcoattiviPhotoActionBloc({required this.ecoattiviRepository})
      : super(const FetchingEcoattiviPhotoActionState()) {
    on<FetchEcoattiviPhotoActionEvent>(_fetchPhotoActions);
  }

  void fetchPhotoActions(String baseUrl, String token, String guid) =>
      add(FetchEcoattiviPhotoActionEvent(baseUrl, token, guid));

  FutureOr<void> _fetchPhotoActions(FetchEcoattiviPhotoActionEvent event,
      Emitter<EcoattiviPhotoActionState> emit) async {
    emit(const FetchingEcoattiviPhotoActionState());
    try {
      final photoActionList = await ecoattiviRepository.getPhotoActions(
          baseUrl: event.baseUrl, token: event.token, guid: event.guid);
      if (photoActionList != null) {
        emit(FetchedEcoattiviPhotoActionState(photoActionList));
      } else {
        emit(const NoEcoattiviPhotoActionState());
      }
    } catch (error) {
      emit(const ErrorEcoattiviPhotoActionState());
    }
  }
}
