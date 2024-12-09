import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/model/garbage/garbage_calendar_element.dart';
import 'package:municipium/repositories/garbage_repository.dart';

part 'garbage_calendar_element_list_event.dart';
part 'garbage_calendar_element_list_state.dart';

class GarbageCategoriesBloc
    extends Bloc<GarbageCategoriesEvent, GarbageCategoriesState> {
  final GarbageRepository garbageCalendarsRepository;

  GarbageCategoriesBloc({required this.garbageCalendarsRepository})
      : super(const FetchingGarbageCategoriesState()) {
    on<FetchGarbageCategoriesEvent>(_fetchGarbageCategories);
  }

  void fetchGarbageCategories(
    String baseUrl,
  ) =>
      add(FetchGarbageCategoriesEvent(baseUrl));

  FutureOr<void> _fetchGarbageCategories(FetchGarbageCategoriesEvent event,
      Emitter<GarbageCategoriesState> emit) async {
    emit(const FetchingGarbageCategoriesState());
    try {
      final garbageCategoriesList = await garbageCalendarsRepository
          .getGarbageCategoriesList(event.baseUrl);

      if (garbageCategoriesList.isNotEmpty) {
        emit(FetchedGarbageCategoriesState(garbageCategoriesList));
      } else {
        emit(const NoGarbageCategoriesState());
      }
    } catch (error) {
      emit(const ErrorGarbageCategoriesState());
    }
  }
}
