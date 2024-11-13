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
  PointOfInterestBloc({required this.pointOfInterestRepository})
      : super(const FetchingPointOfInterestListState()) {
    on<FetchPointOfInterestListEvent>(_fetchPointOfInterestList);
    on<FetchPagedPointOfInterestListEvent>(_fetchPagedPointOfInterestList);
    on<FetchPoiDetailEvent>(_fetchPoiDetail);
  }

  void fetchPointOfInterestList(String baseUrl) =>
      add(FetchPointOfInterestListEvent(baseUrl));

  void fetchPagedPointOfInterestList(String baseUrl) =>
      add(FetchPagedPointOfInterestListEvent(baseUrl));

  void fetchPoiDetail(String baseUrl, int poiId) =>
      add(FetchPoiDetailEvent(baseUrl, poiId));

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

  FutureOr<void> _fetchPointOfInterestList(
      FetchPointOfInterestListEvent fetchPointOfInterestListEvent,
      Emitter<PointOfInterestState> emit) async {
    emit(const FetchingPointOfInterestListState());
    try {
      final pointOfInterestsList =
          await pointOfInterestRepository.getPointOfInterestList(
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
