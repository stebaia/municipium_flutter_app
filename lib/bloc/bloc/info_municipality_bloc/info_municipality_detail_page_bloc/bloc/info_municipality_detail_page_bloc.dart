import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/pages/pages.dart';
import 'package:municipium/repositories/info_municipality_repository.dart';

part 'info_municipality_detail_page_event.dart';
part 'info_municipality_detail_page_state.dart';

class InfoMunicipalityDetailPageBloc extends Bloc<InfoMunicipalityEvent, InfoMunicipalityState> {
  final InfoMunicipalityRepository infoMunicipalityRepository;

  InfoMunicipalityDetailPageBloc({required this.infoMunicipalityRepository})
      : super(const FetchingInfoMunicipalityState()) {
    on<FetchInfoMunicipalityEvent>(_fetchInfoMunicipality);
  }

  void fetchInfoMunicipality(String baseUrl, int id) {
    add(FetchInfoMunicipalityEvent(baseUrl: baseUrl, id: id));
  }

  FutureOr<void> _fetchInfoMunicipality(
      FetchInfoMunicipalityEvent event, Emitter<InfoMunicipalityState> emit) async {
    emit(const FetchingInfoMunicipalityState());
    try {
      final pageDetail = await infoMunicipalityRepository.getPageDetail(
          event.baseUrl, event.id);
      emit(FetchedInfoMunicipalityState(pageDetail));
    } catch (error) {
      emit(const ErrorInfoMunicipalityState());
    }
  }
}