part of 'category_poi_bloc.dart';

abstract class CategoryPoiState extends Equatable {
  const CategoryPoiState();
  
  @override
  List<Object> get props => [];
}

class ErrorCategoryPoiListState extends CategoryPoiState {
  const ErrorCategoryPoiListState();
}

class FetchingCategoryPoiListState extends CategoryPoiState {
  const FetchingCategoryPoiListState();
}

class NoCategoryPoiListState extends CategoryPoiState {
  const NoCategoryPoiListState();
}

class FetchedCategoryPoiListState extends CategoryPoiState {
  final List<CategoryPoiDTO> listCategoryPoi;
  const FetchedCategoryPoiListState(this.listCategoryPoi);

  List<Object> get props => [listCategoryPoi];
}
