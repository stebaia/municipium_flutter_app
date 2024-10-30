part of 'category_poi_bloc.dart';

abstract class CategoryPoiEvent extends Equatable {
  const CategoryPoiEvent();

  @override
  List<Object> get props => [];
}

class FetchCategoryPoiListEvent extends CategoryPoiEvent {
  String baseUrl;
  FetchCategoryPoiListEvent(this.baseUrl);
  @override
  List<Object> get props => [baseUrl];
}
