import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/reservations/reservable_unit.dart';
import 'package:municipium/repositories/reservations_repository.dart';

part 'reservations_unit_event.dart';
part 'reservations_unit_state.dart';

class ReservationsUnitBloc
    extends Bloc<ReservationsUnitEvent, ReservationsUnitState> {
  final ReservationsRepository reservationsRepository;

  ReservationsUnitBloc({required this.reservationsRepository})
      : super(const FetchingReservationUnitsState()) {
    on<FetchReservationsUnitEvent>(_fetchPointOfInterestList);
  }

  void fetchReservationUnits(int municipalityId) =>
      add(FetchReservationsUnitEvent(municipalityId));

  FutureOr<void> _fetchPointOfInterestList(FetchReservationsUnitEvent event,
      Emitter<ReservationsUnitState> emit) async {
    try {
      final units = await reservationsRepository
          .getReservationUnitsList(event.municipalityId!);

      emit(FetchedReservationUnitsState(units));
    } catch (error) {
      emit(const ErrorReservationUnitsState());
    }
  }
}
