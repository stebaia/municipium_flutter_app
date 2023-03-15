part of 'point_of_interest_list_bloc.dart';

abstract class PointOfInterestListState extends Equatable {
  const PointOfInterestListState();
  
  @override
  List<Object> get props => [];
}

class FetchingPointOfInterestListState extends PointOfInterestListState {
  const FetchingPointOfInterestListState();
}

class FetchedPointOfInterestListState extends PointOfInterestListState {
  final PointOfInterestsList pointOfInterestsList;
  const FetchedPointOfInterestListState(this.pointOfInterestsList);

  List<Object> get props => [pointOfInterestsList];
}

class NoPointOfInterestListState extends PointOfInterestListState {
  const NoPointOfInterestListState();
}

class ErrorPointOfInterestListState extends PointOfInterestListState {
  const ErrorPointOfInterestListState();
}

