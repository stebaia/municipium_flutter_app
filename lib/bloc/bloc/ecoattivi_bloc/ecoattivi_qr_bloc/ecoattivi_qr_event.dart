part of 'ecoattivi_qr_bloc.dart';

abstract class EcoattiviQrEvent extends Equatable {
  const EcoattiviQrEvent();

  @override
  List<Object> get props => [];
}

class ScanEcoattiviQrEvent extends EcoattiviQrEvent {
  final String baseUrl;
  final String token;
  final String guid;
  final EcoattiviQrBody body;

  const ScanEcoattiviQrEvent(
      {required this.baseUrl,
      required this.token,
      required this.guid,
      required this.body});

  @override
  List<Object> get props => [baseUrl, token, guid, body];
}
