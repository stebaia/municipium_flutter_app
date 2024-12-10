part of 'garbage_calendar_element_list_bloc.dart';

abstract class GarbageCategoriesState extends Equatable {
  const GarbageCategoriesState();

  @override
  List<Object> get props => [];
}

class FetchingGarbageCategoriesState extends GarbageCategoriesState {
  const FetchingGarbageCategoriesState();
}

class FetchedGarbageCategoriesState extends GarbageCategoriesState {
  final List<WrappedGarbageCalendars> garbageCategoriesList;
  const FetchedGarbageCategoriesState(this.garbageCategoriesList);

  @override
  List<Object> get props => [garbageCategoriesList];
}

class NoGarbageCategoriesState extends GarbageCategoriesState {
  const NoGarbageCategoriesState();
}

class ErrorGarbageCategoriesState extends GarbageCategoriesState {
  const ErrorGarbageCategoriesState();
}
