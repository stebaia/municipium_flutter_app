part of 'payment_response_bloc.dart';

abstract class PaymentResponseEvent extends Equatable {
  const PaymentResponseEvent();

  @override
  List<Object> get props => [];
}

class FetchPaymentResponseEvent extends PaymentResponseEvent {
  final String baseUrl;
  final String ente;
  final String? codice;
  const FetchPaymentResponseEvent(this.baseUrl, this.ente, this.codice);
}
