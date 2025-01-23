import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/garbage/garbage_calendar_element.dart';
import 'package:municipium/repositories/garbage_repository.dart';

part 'garbage_calendar_element_event.dart';
part 'garbage_calendar_element_state.dart';

class GarbageCalendarElementBloc 
    extends Bloc<GarbageCalendarElementEvent, GarbageCalendarElementState> {
  final GarbageRepository garbageCalendarsRepository;

  GarbageCalendarElementBloc({required this.garbageCalendarsRepository})
      : super(const FetchingGarbageCalendarElementState()) {
    on<FetchGarbageCalendarElementEvent>(_fetchGarbageCalendarElement);
  }

  void fetchGarbageCalendarElement(String baseUrl, int id) =>
      add(FetchGarbageCalendarElementEvent(baseUrl, id));

  FutureOr<void> _fetchGarbageCalendarElement(
      FetchGarbageCalendarElementEvent event,
      Emitter<GarbageCalendarElementState> emit) async {
    emit(const FetchingGarbageCalendarElementState());
    try {
      final garbageCalendarElement = await garbageCalendarsRepository
          .getGarbageCalendarElement(event.baseUrl, event.id);
      
      emit(FetchedGarbageCalendarElementState(garbageCalendarElement));
    } catch (error) {
      emit(const ErrorGarbageCalendarElementState());
    }
  }
}