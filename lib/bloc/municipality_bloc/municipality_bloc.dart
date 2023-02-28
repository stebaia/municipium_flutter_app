import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/repositories/municipality_repository.dart';

part 'municipality_event.dart';
part 'municipality_state.dart';

class MunicipalityBloc extends Bloc<MunicipalityEvent, MunicipalityState> {
  final MunicipalityRepository municipalityRepository;

  MunicipalityBloc({required this.municipalityRepository})
      : super(const FetchingMunicipalityState()) {
    on<FetchMunicipalityEvent>(_fetchMunicipality);
  }

  void fetchMunicipality(int municipalityId) =>
      add(FetchMunicipalityEvent(municipalityId: municipalityId));

  FutureOr<void> _fetchMunicipality(
      FetchMunicipalityEvent fetchMunicipalityEvent,
      Emitter<MunicipalityState> emit) async {
    emit(const FetchingMunicipalityState());
    try {
      final municipality = await municipalityRepository
          .saveMunicipality(fetchMunicipalityEvent.municipalityId);
      emit(FetchedMunicipalityState(municipality));
    } catch (error) {
      emit(const ErrorMunicipalityState());
    }
  }
}
