import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/payment/saved_payment.dart';
import 'package:municipium/repositories/payments_repository.dart';

class PaymentCubit extends Cubit<SavedPayment> {
  final PaymentsRepository paymentsRepository;
  PaymentCubit({required this.paymentsRepository}) : super(SavedPayment());
}
