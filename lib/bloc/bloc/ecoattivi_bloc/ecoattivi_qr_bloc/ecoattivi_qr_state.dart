part of 'ecoattivi_qr_bloc.dart';

abstract class EcoattiviQrState extends Equatable {
  const EcoattiviQrState();

  @override
  List<Object> get props => [];
}

class EcoattiviQrInitial extends EcoattiviQrState {}

class EcoattiviQrLoading extends EcoattiviQrState {}

class EcoattiviQrSuccess extends EcoattiviQrState {
  final EcoattiviQrResponse response;

  const EcoattiviQrSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class ErrorEcoattiviQrState extends EcoattiviQrState {
  final String error;

  const ErrorEcoattiviQrState(this.error);

  @override
  List<Object> get props => [error];
}

class EcoattiviQrFailure extends EcoattiviQrState {
  final String error;

  const EcoattiviQrFailure(this.error);

  @override
  List<Object> get props => [error];
}
