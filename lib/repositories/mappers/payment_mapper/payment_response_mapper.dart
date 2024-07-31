import 'package:municipium/model/payment/payment_custom_field.dart';
import 'package:municipium/model/payment/payment_response.dart';
import 'package:municipium/repositories/mappers/payment_mapper/payment_custom_field_mapper.dart';
import 'package:municipium/services/network/dto/payment_response_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PaymentResponseMapper
    extends DTOMapper<PaymentResponseDTO, PaymentResponse> {
  @override
  PaymentResponse fromDTO(PaymentResponseDTO dto) {
    PaymentCustomFieldMapper paymentCustomFieldMapper =
        PaymentCustomFieldMapper();
    List<PaymentCustomField> list = [];
    if (dto.campiCustom != null) {
      for (var type in dto.campiCustom!) {
        list.add(paymentCustomFieldMapper.fromDTO(type));
      }
    }
    return PaymentResponse(
        campiCustom: list,
        success: dto.success,
        configurazione: dto.configurazione,
        tipoPagamento: dto.tipoPagamento,
        tipoIstanzaPagamento: dto.tipoIstanzaPagamento,
        dataScadenza: dto.dataScadenza);
  }

  @override
  PaymentResponseDTO toDTO(PaymentResponse model) {
    throw PaymentResponseDTO();
  }
}
