import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/point_of_intertests_list.dart';
import 'package:municipium/repositories/point_of_interest_repository.dart';
import 'package:municipium/services/network/dto/category_poi_dto.dart';
import 'package:municipium/services/network/dto/poi_detail_dto.dart';

part 'point_of_interest_list_event.dart';
part 'point_of_interest_list_state.dart';

class PointOfInterestBloc
    extends Bloc<PointOfInterestEvent, PointOfInterestState> {
  final PointOfInterestRepository pointOfInterestRepository;
  int page = 0;
  bool isFetching = true;
  bool isSearching = false;
  PointOfInterestsList? originalList;
  PointOfInterestBloc({required this.pointOfInterestRepository})
      : super(const FetchingPointOfInterestListState()) {
    on<FetchPointOfInterestListEvent>(_fetchPointOfInterestList);
    on<FetchPagedPointOfInterestListEvent>(_fetchPagedPointOfInterestList);
    on<FetchPoiDetailEvent>(_fetchPoiDetail);
    on<SearchPointOfInterestEvent>(_searchPointOfInterest);
    on<FilterPointOfInterestByCategoriesEvent>(
        _filterPointOfInterestByCategories);
  }

  void fetchPointOfInterestList(String baseUrl) =>
      add(FetchPointOfInterestListEvent(baseUrl));

  void fetchPagedPointOfInterestList(String baseUrl) =>
      add(FetchPagedPointOfInterestListEvent(baseUrl));

  void fetchPoiDetail(String baseUrl, int poiId) =>
      add(FetchPoiDetailEvent(baseUrl, poiId));

  void filterPoiList(
    final Map<int, bool> selectedCategories,
    final PointOfInterestsList originalList,
    final List<CategoryPoiDTO> categories,
  ) =>
      add(FilterPointOfInterestByCategoriesEvent(selectedCategories, originalList, categories));

  FutureOr<void> _fetchPoiDetail(
      FetchPoiDetailEvent event, Emitter<PointOfInterestState> emit) async {
    try {
      final poiDetail = await pointOfInterestRepository
          .getDetailPoi(event.baseUrl, idPoi: event.poiId);

      emit(FetchedPoiDetailState(poiDetail));
    } catch (error) {
      emit(const ErrorPoiDetailState());
    }
  }

  FutureOr<void> _filterPointOfInterestByCategories(
    FilterPointOfInterestByCategoriesEvent event,
    Emitter<PointOfInterestState> emit,
  ) {
    // If no categories are selected, show all POIs
    if (!event.selectedCategories.containsValue(true)) {
      emit(FetchedPointOfInterestListState(event.originalList));
      return null;
    }

    // Get list of selected category IDs
    final selectedCategoryIds = event.selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // Get all POI IDs that belong to selected categories
    final Set<int> relevantPoiIds = {};
    for (var category in event.categories) {
      if (selectedCategoryIds.contains(category.id)) {
        relevantPoiIds.addAll(category.idPoi ?? []);
      }
    }

    // Filter the original POI list to only include POIs that belong to selected categories
    final filteredItems = event.originalList.pointOfInterestsItemList
        ?.where((poi) => relevantPoiIds.contains(poi.id))
        .toList();

    final filteredList = PointOfInterestsList(
      pointOfInterestsItemList: filteredItems,
    );

    emit(FetchedPointOfInterestListState(filteredList));
  }

  FutureOr<void> _searchPointOfInterest(
    SearchPointOfInterestEvent event,
    Emitter<PointOfInterestState> emit,
  ) {
    if (event.query.isEmpty) {
      emit(FetchedPointOfInterestListState(originalList!));
      return null;
    }

    final filteredItems = originalList!.pointOfInterestsItemList!
        .where((poi) =>
            poi.name?.toLowerCase().contains(event.query.toLowerCase()) ??
            false)
        .toList();

    final filteredList = PointOfInterestsList(
      pointOfInterestsItemList: filteredItems,
    );

    emit(FetchedPointOfInterestListState(filteredList));
  }

  FutureOr<void> _fetchPointOfInterestList(
      FetchPointOfInterestListEvent fetchPointOfInterestListEvent,
      Emitter<PointOfInterestState> emit) async {
    emit(const FetchingPointOfInterestListState());
    try {
      final pointOfInterestsList =
          await pointOfInterestRepository.getPointOfInterestList(
              fetchPointOfInterestListEvent.baseUrl, page, 20);
      originalList = pointOfInterestsList;
      if (pointOfInterestsList.pointOfInterestsItemList!.length > 0) {
        emit(FetchedPointOfInterestListState(pointOfInterestsList));
        page++;
      } else {
        emit(const NoPointOfInterestListState());
      }
    } catch (error) {
      emit(const ErrorPointOfInterestListState());
    }
  }

  FutureOr<void> _fetchPagedPointOfInterestList(
      FetchPagedPointOfInterestListEvent fetchPointOfInterestListEvent,
      Emitter<PointOfInterestState> emit) async {
    emit(const FetchingPointOfInterestListState());
    try {
      final pointOfInterestsList =
          await pointOfInterestRepository.getPagedPointOfInterestList(
              fetchPointOfInterestListEvent.baseUrl, page, 20);
      if (pointOfInterestsList.pointOfInterestsItemList!.length > 0) {
        emit(FetchedPointOfInterestListState(pointOfInterestsList));
        page++;
      } else {
        emit(const NoPointOfInterestListState());
      }
    } catch (error) {
      emit(const ErrorPointOfInterestListState());
    }
  }
}
