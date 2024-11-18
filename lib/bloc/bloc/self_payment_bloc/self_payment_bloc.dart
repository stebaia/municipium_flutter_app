import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/payment/self_payment.dart';
import 'package:municipium/repositories/payments_repository.dart';

part 'self_payment_event.dart';
part 'self_payment_state.dart';

class SelfPaymentBloc extends Bloc<SelfPaymentEvent, SelfPaymentState> {
  final PaymentsRepository paymentRepository;
  List<SelfPayment> allPayments = [];
  List<SelfPayment> allPaymentsFiltered = [];
  bool isFetching = true;
  bool isSearching = false;

  SelfPaymentBloc({required this.paymentRepository})
      : super(const FetchingSelfPaymentState()) {
    on<FetchSelfPaymentEvent>(_fetchSelfPaymentsList);
    on<FilterSelfPaymentEvent>(_filterSelfPaymentsList);
  }

  void fetchSelfPayments(
          String baseUrl, String ente, String? area, String? codice) =>
      add(FetchSelfPaymentEvent(baseUrl, ente, area, codice));
  void filterSelfPayment(String searchText) =>
      add(FilterSelfPaymentEvent(searchText));

  FutureOr<void> _fetchSelfPaymentsList(
      FetchSelfPaymentEvent event, Emitter<SelfPaymentState> emit) async {
    try {
      final payments = await paymentRepository.getSelfPaymentsList(
          event.baseUrl, event.ente, event.area ?? '', event.codice ?? '');
      if (payments.isNotEmpty) {
        allPayments.addAll(payments);
        emit(FetchedSelfPaymentState(allPayments));
      } else {
        emit(const NoSelfPaymentState());
      }
    } catch (error) {
      emit(const ErrorSelfPaymentState());
    }
  }

  Future<void> _filterSelfPaymentsList(
      FilterSelfPaymentEvent event, Emitter<SelfPaymentState> emit) async {
    if (event.searchText.isNotEmpty) {
      final query = event.searchText.toLowerCase();
      allPaymentsFiltered = allPayments
          .map((payment) {
            if ((payment.area ?? '')
                .toLowerCase()
                .contains(event.searchText.toLowerCase())) {
              return payment;
            }
            final filteredTipoPagamenti = (payment.tipoPagamenti ?? [])
                .where((tipoPagamento) =>
                    (tipoPagamento.descrizione ?? '')
                        .toLowerCase()
                        .contains(query) ||
                    (tipoPagamento.codiceDebitoJppa ?? '')
                        .toLowerCase()
                        .contains(query))
                .toList();

            if (filteredTipoPagamenti.isNotEmpty) {
              return SelfPayment(
                area: payment.area,
                tipoPagamenti: filteredTipoPagamenti,
              );
            }
            return null;
          })
          .where((payment) => payment != null)
          .cast<SelfPayment>()
          .toList();
    } else {
      allPaymentsFiltered = allPayments;
    }
    print(
        'list filtering size: ${allPaymentsFiltered.length} vs main list size: ${allPayments.length}');
    emit(FetchedSelfPaymentState(allPaymentsFiltered));
  }
}
