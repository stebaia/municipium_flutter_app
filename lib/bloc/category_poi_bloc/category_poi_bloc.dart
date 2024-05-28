import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/repositories/point_of_interest_repository.dart';
import 'package:municipium/services/network/dto/category_poi_dto.dart';

part 'category_poi_event.dart';
part 'category_poi_state.dart';

class CategoryPoiBloc extends Bloc<CategoryPoiEvent, CategoryPoiState> {
  CategoryPoiBloc({required this.pointOfInterestRepository}) : super(FetchingCategoryPoiListState()) {
    on<FetchCategoryPoiListEvent>(_fetchCategoryPoiList);
  }

  final PointOfInterestRepository pointOfInterestRepository;


  void fetchCategoryPoiList() => add(FetchCategoryPoiListEvent());


  FutureOr<void> _fetchCategoryPoiList(FetchCategoryPoiListEvent fetchCategoryPoiListEvent, Emitter<CategoryPoiState> emitter) async {
    emit(const FetchingCategoryPoiListState());
    try {
      final categoryPoiList = await pointOfInterestRepository.getCategoryPoiList();
      if(categoryPoiList.isNotEmpty) {
        emit(FetchedCategoryPoiListState(categoryPoiList));
      }else {
        emit(const NoCategoryPoiListState());
      }
    }catch(e){
      emit(const ErrorCategoryPoiListState());
    }
  }
}
