part of 'recycling_areas_bloc.dart';

abstract class RecyclingAreasState extends Equatable {
  const RecyclingAreasState();

  @override
  List<Object> get props => [];
}

class FetchingRecyclingAreasState extends RecyclingAreasState {
  const FetchingRecyclingAreasState();
}

class FetchedRecyclingAreasState extends RecyclingAreasState {
  final List<PoiDetailDTO> recyclingAreas;
  const FetchedRecyclingAreasState(this.recyclingAreas);

  @override
  List<Object> get props => [recyclingAreas];
}

class NoRecyclingAreasState extends RecyclingAreasState {
  const NoRecyclingAreasState();
}

class ErrorRecyclingAreasState extends RecyclingAreasState {
  const ErrorRecyclingAreasState();
}