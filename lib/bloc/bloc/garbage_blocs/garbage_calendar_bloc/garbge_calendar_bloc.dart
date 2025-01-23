import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/repositories/garbage_repository.dart';

part 'garbge_calendar_event.dart';
part 'garbge_calendar_state.dart';

class GarbageCalendarsBloc 
    extends Bloc<GarbageCalendarsEvent, GarbageCalendarsState> {
  final GarbageRepository garbageCalendarsRepository;

  GarbageCalendarsBloc({required this.garbageCalendarsRepository})
      : super(const FetchingGarbageCalendarsState()) {
    on<FetchGarbageCalendarsEvent>(_fetchGarbageCalendars);
  }

  void fetchGarbageCalendars(String baseUrl, ) =>
      add(FetchGarbageCalendarsEvent(baseUrl, ));

  FutureOr<void> _fetchGarbageCalendars(
      FetchGarbageCalendarsEvent event,
      Emitter<GarbageCalendarsState> emit) async {
    emit(const FetchingGarbageCalendarsState());
    try {
      final garbageCalendarsList = await garbageCalendarsRepository
          .getGarbageCalendarsList(event.baseUrl);
      
      if (garbageCalendarsList.isNotEmpty) {
        emit(FetchedGarbageCalendarsState(garbageCalendarsList));
      } else {
        emit(const NoGarbageCalendarsState());
      }
    } catch (error) {
      emit(const ErrorGarbageCalendarsState());
    }
  }
}
