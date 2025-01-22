part of 'garbage_calendar_element_list_bloc.dart';

abstract class GarbageCategoriesEvent extends Equatable {
  const GarbageCategoriesEvent();

  @override
  List<Object> get props => [];
}

class FetchGarbageCategoriesEvent extends GarbageCategoriesEvent {
  final String baseUrl;
  const FetchGarbageCategoriesEvent(
    this.baseUrl,
  );

  @override
  List<Object> get props => [baseUrl];
}


class FilterGarbageCalendarElementEvent extends GarbageCategoriesEvent {
  final String letter;
  const FilterGarbageCalendarElementEvent(this.letter);

  @override
  List<Object> get props => [letter];
}

