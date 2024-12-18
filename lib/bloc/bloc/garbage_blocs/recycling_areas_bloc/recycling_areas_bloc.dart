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

  RecyclingAreasBloc({required this.repository})
      : super(const FetchingRecyclingAreasState()) {
    on<FetchRecyclingAreasEvent>(_fetchRecyclingAreas);
  }

  void fetchRecyclingAreas(String baseUrl) =>
      add(FetchRecyclingAreasEvent(baseUrl));

  FutureOr<void> _fetchRecyclingAreas(
      FetchRecyclingAreasEvent event,
      Emitter<RecyclingAreasState> emit) async {
    emit(const FetchingRecyclingAreasState());
    try {
      final recyclingAreas = await repository
          .getRecyclingAreas(event.baseUrl);
      
      if (recyclingAreas.isNotEmpty) {
        emit(FetchedRecyclingAreasState(recyclingAreas));
      } else {
        emit(const NoRecyclingAreasState());
      }
    } catch (error) {
      emit(const ErrorRecyclingAreasState());
    }
  }
}
