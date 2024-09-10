part of 'pnrr_body_bloc.dart';

abstract class PnrrBodyEvent extends Equatable {
  const PnrrBodyEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchPnrrBodyEvent extends PnrrBodyEvent {
  const FetchPnrrBodyEvent({required this.type, required this.id});

  final String type;
  final int id;
  @override
  List<Object> get props => [];
}
