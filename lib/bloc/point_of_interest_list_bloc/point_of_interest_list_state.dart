part of 'point_of_interest_list_bloc.dart';

abstract class PointOfInterestState extends Equatable {
  const PointOfInterestState();
  
  @override
  List<Object> get props => [];
}

class FetchingPointOfInterestListState extends PointOfInterestState {
  const FetchingPointOfInterestListState();
}

class FetchedPointOfInterestListState extends PointOfInterestState {
  final PointOfInterestsList pointOfInterestsList;
  const FetchedPointOfInterestListState(this.pointOfInterestsList);

  List<Object> get props => [pointOfInterestsList];
}

class NoPointOfInterestListState extends PointOfInterestState {
  const NoPointOfInterestListState();
}

class ErrorPointOfInterestListState extends PointOfInterestState {
  const ErrorPointOfInterestListState();
}

class FetchingPoiDetailState extends PointOfInterestState {
  const FetchingPoiDetailState();
}

class ErrorPoiDetailState extends PointOfInterestState {
  const ErrorPoiDetailState();
}

class FetchedPoiDetailState extends PointOfInterestState {
  final PoiDetailDTO poiDetailDTO;
  const FetchedPoiDetailState(this.poiDetailDTO);

  List<Object> get props => [poiDetailDTO];
}


