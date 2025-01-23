import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/payment/payment_response.dart';
import 'package:municipium/repositories/payments_repository.dart';

part 'payment_response_event.dart';
part 'payment_response_state.dart';

class PaymentResponseBloc
    extends Bloc<PaymentResponseEvent, PaymentResponseState> {
  final PaymentsRepository paymentRepository;

  PaymentResponseBloc({required this.paymentRepository})
      : super(const FetchingPaymentResponseState()) {
    on<FetchPaymentResponseEvent>(_fetchPaymentResponseList);
  }

  void fetchPaymentResponse(String baseUrl, String ente, String? codice) =>
      add(FetchPaymentResponseEvent(baseUrl, ente, codice));

  FutureOr<void> _fetchPaymentResponseList(FetchPaymentResponseEvent event,
      Emitter<PaymentResponseState> emit) async {
    try {
      final payment = await paymentRepository.getPaymentResponse(
          event.baseUrl, event.ente, event.codice ?? '');
      emit(FetchedPaymentResponseState(payment));
    } catch (error) {
      emit(const ErrorPaymentResponseState());
    }
  }
}
