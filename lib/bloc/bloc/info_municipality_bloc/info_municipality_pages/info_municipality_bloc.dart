import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/pages/pages.dart';
import 'package:municipium/repositories/info_municipality_repository.dart';

part 'info_municipality_event.dart';
part 'info_municipality_state.dart';

class InfoMunicipalityBloc extends Bloc<InfoMunicipalityPageEvent, InfoMunicipalityPageState> {
  final InfoMunicipalityRepository infoMunicipalityRepository;

  InfoMunicipalityBloc({required this.infoMunicipalityRepository})
      : super(const FetchingListPageInfoMunicipalityState()) {
    on<FetchInfoMunicipalityPageEvent>(_fetchInfoMunicipality);
  }

  void fetchInfoMunicipality(String baseUrl, ) {
    add(FetchInfoMunicipalityPageEvent(baseUrl: baseUrl));
  }

  FutureOr<void> _fetchInfoMunicipality(
      FetchInfoMunicipalityPageEvent event, Emitter<InfoMunicipalityPageState> emit) async {
    emit(const FetchingListPageInfoMunicipalityState());
    try {
      final pageList = await infoMunicipalityRepository.getPageList(
          event.baseUrl, );
      if (pageList.isNotEmpty) {
        emit(FetchedListPageInfoMunicipalityState(pageList));
      } else {
        emit(const NoListPageInfoMunicipalityState());
      }
    } catch (error) {
      emit(const ErrorListPageInfoMunicipalityState());
    }
  }
}

