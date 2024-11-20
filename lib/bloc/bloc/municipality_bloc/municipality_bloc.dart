import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/repositories/municipality_repository.dart';
import 'package:municipium/repositories/user_repository.dart';

part 'municipality_event.dart';
part 'municipality_state.dart';

class MunicipalityBloc extends Bloc<MunicipalityEvent, MunicipalityState> {
  int page = 0;
  bool isFetching = true;
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

  void fetchMunicipalityListWithPosition(
          String baseUrl, double lat, double lng) =>
      add(FetchMunicipalityListWithPositionEvent(
          baseUrl: baseUrl, lat: lat, lng: lng));

  void fetchMunicipalityList(String baseUrl) =>
      add(FetchMunicipalityListEvent(baseUrl));

  void filterMunicipalityList(String baseUrl,String filterText,) =>
      add(FilterMunicipalityListEvent(baseUrl: baseUrl,filterText: filterText));

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

  Future<Configurations?> getConfigurations() async {
    try {
      final config =
          await municipalityRepository.getMunicipalityConfigurations();
      return config;
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
      final filteredList = await municipalityRepository.getMunicipalityFilterByName(baseUrl: event.baseUrl,name: event.filterText);
      emit(FetchedFilteredMunicipalityListState(filteredList));
    } catch (error) {
      emit(const ErrorMunicipalityState());
    }
  }

  Future<FutureOr<void>> _fetchMunicipalityList(
      FetchMunicipalityListEvent event, Emitter<MunicipalityState> emit) async {
    emit(const FetchingMunicipalityState());
    try {
    
      final municipalityList =
          await municipalityRepository.getMunicipalityListPaged(baseUrl: event.baseUrl, pageIndex: page, pageSize: 40);
      _municipalityList = municipalityList;
      if(_municipalityList.isNotEmpty) {
        emit(FetchedMunicipalityListState(municipalityList));
        page ++;
      } 
      
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
          .getMunicipalityListFromPosition(event.baseUrl, event.lat, event.lng);
      emit(FetchedMunicipalityListState(municipalityList));
    } catch (ex) {
      emit(const ErrorMunicipalityState());
    }
  }

  void fetchMunicipality(
          String baseUrl, String baseUrlBe, int municipalityId) =>
      add(FetchMunicipalityEvent(
          baseUrl: baseUrl,
          baseUrlBe: baseUrlBe,
          municipalityId: municipalityId));

  FutureOr<void> _fetchMunicipality(
      FetchMunicipalityEvent fetchMunicipalityEvent,
      Emitter<MunicipalityState> emit) async {
    emit(const FetchingMunicipalityState());
    try {
      //deleteMunicipality();
      final municipality = await municipalityRepository.saveMunicipality(
          fetchMunicipalityEvent.baseUrl,
          fetchMunicipalityEvent.baseUrlBe,
          fetchMunicipalityEvent.municipalityId);
      emit(FetchedMunicipalityState(municipality));
    } catch (error) {
      emit(const ErrorMunicipalityState());
    }
  }

  FutureOr<void> deleteMunicipality() async {
    await municipalityRepository.secureStorage
        .deleteMunicipalitylKeySecureData();
  }

}
