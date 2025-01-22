part of 'point_of_interest_list_bloc.dart';

abstract class PointOfInterestEvent extends Equatable {
  const PointOfInterestEvent();

  @override
  List<Object> get props => [];
}


class FetchPagedPointOfInterestListEvent extends PointOfInterestEvent {
  String baseUrl;
  
  FetchPagedPointOfInterestListEvent(this.baseUrl);
  @override
  List<Object> get props => [baseUrl];
}

class FetchPointOfInterestListEvent extends PointOfInterestEvent {
  String baseUrl;
  FetchPointOfInterestListEvent(this.baseUrl);
  @override
  List<Object> get props => [baseUrl];
}

class FetchPoiDetailEvent extends PointOfInterestEvent {
  final int poiId;
  String baseUrl;
  FetchPoiDetailEvent(this.baseUrl, this.poiId);
  @override
  List<Object> get props => [];
}

class FilterPointOfInterestByCategoriesEvent extends PointOfInterestEvent {
  final Map<int, bool> selectedCategories;
  final PointOfInterestsList originalList;
  final List<CategoryPoiDTO> categories;

  const FilterPointOfInterestByCategoriesEvent(
    this.selectedCategories, 
    this.originalList,
    this.categories,
  );
}
