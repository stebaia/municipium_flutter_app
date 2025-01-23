part of 'ecoattivi_message_bloc.dart';

abstract class EcoattiviMessageState extends Equatable {
  const EcoattiviMessageState();

  @override
  List<Object> get props => [];
}

class FetchingEcoattiviMessageState extends EcoattiviMessageState {
  const FetchingEcoattiviMessageState();
}

class FetchedEcoattiviMessageState extends EcoattiviMessageState {
  final List<EcoattiviMessage> ecoattiviMessages;
  const FetchedEcoattiviMessageState(this.ecoattiviMessages);

  @override
  List<Object> get props => [ecoattiviMessages];
}

class NoEcoattiviMessageState extends EcoattiviMessageState {
  const NoEcoattiviMessageState();
}

class ErrorEcoattiviMessageState extends EcoattiviMessageState {
  const ErrorEcoattiviMessageState();
}
