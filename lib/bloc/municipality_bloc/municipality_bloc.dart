import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/repositories/municipality_repository.dart';

part 'municipality_event.dart';
part 'municipality_state.dart';

class MunicipalityBloc extends Bloc<MunicipalityEvent, MunicipalityState> {
  final MunicipalityRepository municipalityRepository;
  List<Municipality> _municipalityList = [];

  MunicipalityBloc({required this.municipalityRepository})
      : super(const FetchingMunicipalityState()) {
    on<FetchMunicipalityEvent>(_fetchMunicipality);
    on<FetchMunicipalityListEvent>(_fetchMunicipalityList);
    on<FilterMunicipalityListEvent>(_filterMunicipalityList);
    on<FetchMunicipalityListWithPositionEvent>(
        _fetchMunicipalityListWithPosition);
  }

  void fetchMunicipalityListWithPosition(double lat, double lng) =>
      add(FetchMunicipalityListWithPositionEvent(lat: lat, lng: lng));

  void fetchMunicipalityList() => add(const FetchMunicipalityListEvent());

  void filterMunicipalityList(String filterText) =>
      add(FilterMunicipalityListEvent(filterText: filterText));

  void checkMunicipalityState() async {
    try {
      final municipality = await municipalityRepository.currentMunicipality;
      if (municipality != null) {
        emit(FetchedMunicipalityState(municipality));
      } else {
        emit(NoMunicipalityState());
      }
    } catch (e) {
      emit(NoMunicipalityState());
    }
  }

  Future<Municipality?> getMunicipality() async {
    try {
      final municipality = await municipalityRepository.currentMunicipality;
      return municipality;
    } catch (e) {
      return null;
    }
  }

  Future<DeviceBe?> getDevice() async {
    try {
      final device = await municipalityRepository.getCurrentDevice();
      return device;
    } catch (e) {
      return null;
    }
  }

  Future<void> _filterMunicipalityList(FilterMunicipalityListEvent event,
      Emitter<MunicipalityState> emit) async {
    try {
      // Eseguire il filtro sulla lista completa delle municipalità
      final filteredList = _municipalityList
          .where((municipality) => municipality.municipalityName
              .toLowerCase()
              .contains(event.filterText.toLowerCase()))
          .toList();
      emit(FetchedMunicipalityListState(filteredList));
    } catch (error) {
      emit(const ErrorMunicipalityState());
    }
  }

  Future<FutureOr<void>> _fetchMunicipalityList(
      FetchMunicipalityListEvent event, Emitter<MunicipalityState> emit) async {
    emit(const FetchingMunicipalityState());
    try {
      final municipalityList =
          await municipalityRepository.getMunicipalityList();
      _municipalityList = municipalityList;
      emit(FetchedMunicipalityListState(municipalityList));
    } catch (ex) {
      emit(const ErrorMunicipalityState());
    }
  }

  Future<FutureOr<void>> _fetchMunicipalityListWithPosition(
      FetchMunicipalityListWithPositionEvent event,
      Emitter<MunicipalityState> emit) async {
    emit(const FetchingMunicipalityState());
    try {
      final municipalityList = await municipalityRepository
          .getMunicipalityListFromPosition(event.lat, event.lng);
      emit(FetchedMunicipalityListState(municipalityList));
    } catch (ex) {
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
