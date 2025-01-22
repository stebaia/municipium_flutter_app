import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/repositories/garbage_repository.dart';
import 'package:municipium/services/network/dto/poi_detail_dto.dart';

part 'recycling_areas_event.dart';
part 'recycling_areas_state.dart';

class RecyclingAreasBloc 
    extends Bloc<RecyclingAreasEvent, RecyclingAreasState> {
  final GarbageRepository repository;
  final List<PoiDetailDTO> allRecyclingAreas = [];
  List<PoiDetailDTO> filterRecyclingAreasList = [];

  bool isSearching = false;

  RecyclingAreasBloc({required this.repository})
      : super(const FetchingRecyclingAreasState()) {
    on<FetchRecyclingAreasEvent>(_fetchRecyclingAreas);
    on<FilterRecyclingAreasEvent>(_filterRecyclingAreas);
  }

  void fetchRecyclingAreas(String baseUrl) =>
      add(FetchRecyclingAreasEvent(baseUrl));

  void filterRecyclingAreas(String letter) =>
      add(FilterRecyclingAreasEvent(letter));

  FutureOr<void> _fetchRecyclingAreas(
      FetchRecyclingAreasEvent event,
      Emitter<RecyclingAreasState> emit) async {
    emit(const FetchingRecyclingAreasState());
    try {
      final recyclingAreas = await repository
          .getRecyclingAreas(event.baseUrl);
      
      if (recyclingAreas.isNotEmpty) {
        allRecyclingAreas.addAll(recyclingAreas);
        emit(FetchedRecyclingAreasState(allRecyclingAreas));
      } else {
        emit(const NoRecyclingAreasState());
      }
    } catch (error) {
      emit(const ErrorRecyclingAreasState());
    }
  }

  FutureOr<void> _filterRecyclingAreas(
      FilterRecyclingAreasEvent event,
      Emitter<RecyclingAreasState> emit) async {
    emit(const FetchingRecyclingAreasState()); {
      filterRecyclingAreasList = event.letter != ''
        ? allRecyclingAreas
            .where((garbageItem) => garbageItem.name!
                .toLowerCase()
                .contains(event.letter.toLowerCase()))
            .toList()
        : allRecyclingAreas;
    emit(FetchedRecyclingAreasState(filterRecyclingAreasList));
    }
      
  }
}
