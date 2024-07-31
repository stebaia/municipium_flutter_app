part of 'payment_response_bloc.dart';

abstract class PaymentResponseState extends Equatable {
  const PaymentResponseState();

  @override
  List<Object> get props => [];
}

class FetchingPaymentResponseState extends PaymentResponseState {
  const FetchingPaymentResponseState();
}

class FetchedPaymentResponseState extends PaymentResponseState {
  final PaymentResponse paymentResponse;
  const FetchedPaymentResponseState(this.paymentResponse);
  @override
  List<Object> get props => [paymentResponse];
}

class NoPaymentResponseState extends PaymentResponseState {
  const NoPaymentResponseState();
}

class ErrorPaymentResponseState extends PaymentResponseState {
  const ErrorPaymentResponseState();
}
