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
    on<FetchMunicipalityListEvent>(_fetchMunicipalityList);
    on<FetchMunicipalityListWithPositionEvent>(_fetchMunicipalityListWithPosition );
  }

  void fetchMunicipalityListWithPosition(double lat, double lng) => add(FetchMunicipalityListWithPositionEvent(lat: lat, lng: lng));

  void fetchMunicipalityList() => add(const FetchMunicipalityListEvent());

  Future<FutureOr<void>> _fetchMunicipalityList(FetchMunicipalityListEvent event,
      Emitter<MunicipalityState> emit) async {
        emit(const FetchingMunicipalityState());
        try {
          final municipalityList = await municipalityRepository.getMunicipalityList();
          emit(FetchedMunicipalityListState(municipalityList));
        }catch (ex){
          emit(const ErrorMunicipalityState());
        }
      }

  Future<FutureOr<void>> _fetchMunicipalityListWithPosition(FetchMunicipalityListWithPositionEvent event,
      Emitter<MunicipalityState> emit) async {
        emit(const FetchingMunicipalityState());
        try {
          final municipalityList = await municipalityRepository.getMunicipalityListFromPosition(event.lat, event.lng);
          emit(FetchedMunicipalityListState(municipalityList));
        }catch (ex){
          emit(const ErrorMunicipalityState());
        }
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
