part of 'category_poi_bloc.dart';

abstract class CategoryPoiEvent extends Equatable {
  const CategoryPoiEvent();

  @override
  List<Object> get props => [];
}

class FetchCategoryPoiListEvent extends CategoryPoiEvent {
  const FetchCategoryPoiListEvent();
   @override
  List<Object> get props => [];
}