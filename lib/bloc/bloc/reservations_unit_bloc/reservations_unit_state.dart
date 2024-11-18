part of 'reservations_unit_bloc.dart';

abstract class ReservationsUnitState extends Equatable {
  const ReservationsUnitState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchingReservationUnitsState extends ReservationsUnitState {
  const FetchingReservationUnitsState();
}

class FetchedReservationUnitsState extends ReservationsUnitState {
  final List<ReservableUnit> reservationList;
  const FetchedReservationUnitsState(this.reservationList);
  @override
  List<Object> get props => [reservationList];
}

class NoReservationUnitsState extends ReservationsUnitState {
  const NoReservationUnitsState();
}

class ErrorReservationUnitsState extends ReservationsUnitState {
  const ErrorReservationUnitsState();
}
