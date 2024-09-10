import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/payment/saved_payment.dart';
import 'package:municipium/repositories/payments_repository.dart';

class PaymentCubit extends Cubit<SavedPayment> {
  final PaymentsRepository paymentsRepository;
  PaymentCubit({required this.paymentsRepository}) : super(SavedPayment());

  void setCurrentPage(int page) {
    final updated = state.copyWith(currentPage: page);
    emit(updated);
  }

  void setIsGiuridicPerson(bool value) {
    final updated = state.copyWith(
        isSelectedGiuridicPerson: value, isSelectedFisicPerson: false);
    emit(updated);
  }

  void setIsFisicPerson(bool value) {
    final updated = state.copyWith(
        isSelectedFisicPerson: value, isSelectedGiuridicPerson: false);
    emit(updated);
  }

  void setIsStranger(bool value) {
    final updated = state.copyWith(strangerPerson: value);
    emit(updated);
  }
}
