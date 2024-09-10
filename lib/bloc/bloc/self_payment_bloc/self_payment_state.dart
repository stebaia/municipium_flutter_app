part of 'self_payment_bloc.dart';

abstract class SelfPaymentState extends Equatable {
  const SelfPaymentState();

  @override
  List<Object> get props => [];
}

class FetchingSelfPaymentState extends SelfPaymentState {
  const FetchingSelfPaymentState();
}

class FetchedSelfPaymentState extends SelfPaymentState {
  final List<SelfPayment> selfPaymentsList;
  const FetchedSelfPaymentState(this.selfPaymentsList);
  @override
  List<Object> get props => [selfPaymentsList];
}

class NoSelfPaymentState extends SelfPaymentState {
  const NoSelfPaymentState();
}

class ErrorSelfPaymentState extends SelfPaymentState {
  const ErrorSelfPaymentState();
}
