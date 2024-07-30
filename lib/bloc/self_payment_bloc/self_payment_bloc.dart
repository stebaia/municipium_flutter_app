import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/payment/self_payment.dart';
import 'package:municipium/repositories/payments_repository.dart';

part 'self_payment_event.dart';
part 'self_payment_state.dart';

class SelfPaymentBloc extends Bloc<SelfPaymentEvent, SelfPaymentState> {
  final PaymentsRepository paymentRepository;

  SelfPaymentBloc({required this.paymentRepository})
      : super(const FetchingSelfPaymentState()) {
    on<FetchSelfPaymentEvent>(_fetchSelfPaymentsList);
  }

  void fetchSelfPayments(
          String baseUrl, String ente, String? area, String? codice) =>
      add(FetchSelfPaymentEvent(baseUrl, ente, area, codice));

  FutureOr<void> _fetchSelfPaymentsList(
      FetchSelfPaymentEvent event, Emitter<SelfPaymentState> emit) async {
    try {
      final payments = await paymentRepository.getSelfPaymentsList(
          event.baseUrl, event.ente, event.area ?? '', event.codice ?? '');

      emit(FetchedSelfPaymentState(payments));
    } catch (error) {
      emit(const ErrorSelfPaymentState());
    }
  }
}
