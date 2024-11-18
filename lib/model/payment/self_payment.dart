import 'package:municipium/model/payment/payment_type.dart';

class SelfPayment {
  String? area;
  int? areaOrdinamento;
  List<PaymentType>? tipoPagamenti;
  String? success;

  SelfPayment(
      {this.area, this.areaOrdinamento, this.tipoPagamenti, this.success});
}
