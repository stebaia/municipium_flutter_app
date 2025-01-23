part of 'ecoattivi_message_bloc.dart';

abstract class EcoattiviMessageEvent extends Equatable {
  const EcoattiviMessageEvent();

  @override
  List<Object> get props => [];
}

class FetchEcoattiviMessageEvent extends EcoattiviMessageEvent {
  final String baseUrl;
  final String token;
  final String guid;
  FetchEcoattiviMessageEvent(
      {required this.baseUrl, required this.token, required this.guid});

  @override
  List<Object> get props => [baseUrl];
}
