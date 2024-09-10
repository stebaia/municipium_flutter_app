part of 'reservations_unit_bloc.dart';

abstract class ReservationsUnitEvent extends Equatable {
  const ReservationsUnitEvent();

  @override
  List<Object> get props => [];
}

class FetchReservationsUnitEvent extends ReservationsUnitEvent {
  final int? municipalityId;
  const FetchReservationsUnitEvent(this.municipalityId);
}
