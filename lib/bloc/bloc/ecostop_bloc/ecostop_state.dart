part of 'ecostop_bloc.dart';

abstract class EcostopState extends Equatable {
  const EcostopState();

  @override
  List<Object> get props => [];
}

class FetchingEcostopState extends EcostopState {
  const FetchingEcostopState();
}

class FetchedEcostopState extends EcostopState {
  final List<Ecostop> ecostopList;
  const FetchedEcostopState(this.ecostopList);

  @override
  List<Object> get props => [ecostopList];
}

class NoEcostopState extends EcostopState {
  const NoEcostopState();
}

class ErrorEcostopState extends EcostopState {
  const ErrorEcostopState();
}
