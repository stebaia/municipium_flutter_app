import 'package:municipium/model/payment/payment_custom_field.dart';
import 'package:municipium/services/network/dto/payment_response_dto.dart';

class PaymentResponse {
  String? success;
  Configuration? configurazione;
  PaymentResponseType? tipoPagamento;
  List<PaymentCustomField>? campiCustom;
  String? tipoIstanzaPagamento;
  String? dataScadenza;

  PaymentResponse(
      {this.success,
      this.configurazione,
      this.tipoPagamento,
      this.campiCustom,
      this.tipoIstanzaPagamento,
      this.dataScadenza});
}
