import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/point_of_intertests_list.dart';
import 'package:municipium/repositories/point_of_interest_repository.dart';
import 'package:municipium/services/network/dto/category_poi_dto.dart';

part 'point_of_interest_list_event.dart';
part 'point_of_interest_list_state.dart';

class PointOfInterestListBloc
    extends Bloc<PointOfInterestListEvent, PointOfInterestListState> {
  final PointOfInterestRepository pointOfInterestRepository;
  int page = 1;
  bool isFetching = true;
  PointOfInterestListBloc({required this.pointOfInterestRepository})
      : super(const FetchingPointOfInterestListState()) {
    on<FetchPointOfInterestListEvent>(_fetchPointOfInterestList);
    
  }

  

  void fetchPointOfInterestList() => add(
      FetchPointOfInterestListEvent());

  
  

  FutureOr<void> _fetchPointOfInterestList(
      FetchPointOfInterestListEvent fetchPointOfInterestListEvent,
      Emitter<PointOfInterestListState> emit) async {
    emit(const FetchingPointOfInterestListState());
    try {
      final pointOfInterestsList =
          await pointOfInterestRepository.getPointOfInterestList(
              page,
              20);
      if (pointOfInterestsList.pointOfInterestsItemList!.length > 0){
        emit(FetchedPointOfInterestListState(pointOfInterestsList));
        page++;
      }else {
        emit(const NoPointOfInterestListState());
      }    
    } catch (error) {
      emit(const ErrorPointOfInterestListState());
    }
  }
}
