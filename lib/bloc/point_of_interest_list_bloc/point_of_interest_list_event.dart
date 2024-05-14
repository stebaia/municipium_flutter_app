part of 'point_of_interest_list_bloc.dart';

abstract class PointOfInterestEvent extends Equatable {
  const PointOfInterestEvent();

  @override
  List<Object> get props => [];
}
class FetchPointOfInterestListEvent extends PointOfInterestEvent {
  const FetchPointOfInterestListEvent();
   @override
  List<Object> get props => [];
}

class FetchPoiDetailEvent extends PointOfInterestEvent {
  final int poiId;
  const FetchPoiDetailEvent(this.poiId);
   @override
  List<Object> get props => [];
}