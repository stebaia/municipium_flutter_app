import 'package:equatable/equatable.dart';

class ReservableUnit extends Equatable {
  String? titolo;
  int? id;

  ReservableUnit({required this.titolo, required this.id});

  @override
  List<Object?> get props => [titolo, id];
}
