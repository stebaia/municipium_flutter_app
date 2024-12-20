import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/model/garbage/garbage_calendar_element.dart';
import 'package:municipium/repositories/garbage_repository.dart';

part 'garbage_calendar_element_list_event.dart';
part 'garbage_calendar_element_list_state.dart';

class GarbageCategoriesBloc
    extends Bloc<GarbageCategoriesEvent, GarbageCategoriesState> {
  final GarbageRepository garbageCalendarsRepository;
  final List<WrappedGarbageCalendars> allGarbageCategories = [];
  List<WrappedGarbageCalendars> garbageCategoriesList = [];

  bool isSearching = false;

  GarbageCategoriesBloc({required this.garbageCalendarsRepository})
      : super(const FetchingGarbageCategoriesState()) {
    on<FetchGarbageCategoriesEvent>(_fetchGarbageCategories);
    on<FilterGarbageCalendarElementEvent>(_filterGarbageListElement);
  }

  void fetchGarbageCategories(
    String baseUrl,
  ) =>
      add(FetchGarbageCategoriesEvent(baseUrl));

  void filterGarbageCategories(
    String letter,
  ) =>
      add(FilterGarbageCalendarElementEvent(letter));

  FutureOr<void> _fetchGarbageCategories(FetchGarbageCategoriesEvent event,
      Emitter<GarbageCategoriesState> emit) async {
    emit(const FetchingGarbageCategoriesState());
    try {
      final garbageCategoriesListTmp = await garbageCalendarsRepository
          .getGarbageCategoriesList(event.baseUrl);
      if (garbageCategoriesListTmp.isNotEmpty) {
        allGarbageCategories.addAll(garbageCategoriesListTmp);

        emit(FetchedGarbageCategoriesState(allGarbageCategories));
      } else {
        emit(const NoGarbageCategoriesState());
      }
    } catch (error) {
      emit(const ErrorGarbageCategoriesState());
    }
  }


  Future<void> _filterGarbageListElement(
      FilterGarbageCalendarElementEvent event, Emitter<GarbageCategoriesState> emit) async {
     garbageCategoriesList = event.letter != ''
        ? allGarbageCategories
            .where((garbageItem) => garbageItem.garbageCalendars.name
                .toLowerCase()
                .contains(event.letter.toLowerCase()))
            .toList()
        : allGarbageCategories;
    emit(FetchedGarbageCategoriesState(garbageCategoriesList));
  }

  
}
