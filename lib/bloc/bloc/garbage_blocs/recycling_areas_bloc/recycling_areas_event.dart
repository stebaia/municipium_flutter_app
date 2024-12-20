part of 'recycling_areas_bloc.dart';

abstract class RecyclingAreasEvent extends Equatable {
  const RecyclingAreasEvent();

  @override
  List<Object> get props => [];
}

class FetchRecyclingAreasEvent extends RecyclingAreasEvent {
  final String baseUrl;
  const FetchRecyclingAreasEvent(this.baseUrl);

  @override
  List<Object> get props => [baseUrl];
}


class FilterRecyclingAreasEvent extends RecyclingAreasEvent {
  final String letter;
  const FilterRecyclingAreasEvent(this.letter);

  @override
  List<Object> get props => [letter];
}
