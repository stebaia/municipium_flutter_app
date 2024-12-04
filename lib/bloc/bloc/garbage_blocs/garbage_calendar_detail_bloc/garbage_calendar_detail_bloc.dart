import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/garbage/garbage_detail_calendar.dart';
import 'package:municipium/repositories/garbage_repository.dart';

part 'garbage_calendar_detail_event.dart';
part 'garbage_calendar_detail_state.dart';

class GarbageDetailCalendarsBloc 
    extends Bloc<GarbageDetailCalendarsEvent, GarbageDetailCalendarsState> {
  final GarbageRepository garbageCalendarsRepository;

  GarbageDetailCalendarsBloc({required this.garbageCalendarsRepository})
      : super(const FetchingGarbageDetailCalendarsState()) {
    on<FetchGarbageDetailCalendarsEvent>(_fetchGarbageDetailCalendars);
  }

  void fetchGarbageDetailCalendars(String baseUrl, String id, String start, String end) =>
      add(FetchGarbageDetailCalendarsEvent(baseUrl, id, start, end));

  FutureOr<void> _fetchGarbageDetailCalendars(
      FetchGarbageDetailCalendarsEvent event,
      Emitter<GarbageDetailCalendarsState> emit) async {
    emit(const FetchingGarbageDetailCalendarsState());
    try {
      final garbageDetailCalendarsList = await garbageCalendarsRepository
          .getGarbageDetailCalendars(event.baseUrl, event.id, event.start, event.end);
      
      if (garbageDetailCalendarsList.isNotEmpty) {
        emit(FetchedGarbageDetailCalendarsState(garbageDetailCalendarsList));
      } else {
        emit(const NoGarbageDetailCalendarsState());
      }
    } catch (error) {
      emit(const ErrorGarbageDetailCalendarsState());
    }
  }
}
