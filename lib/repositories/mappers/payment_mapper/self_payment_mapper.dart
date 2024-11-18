import 'package:municipium/model/payment/payment_type.dart';
import 'package:municipium/model/payment/self_payment.dart';
import 'package:municipium/repositories/mappers/payment_mapper/payment_type_mapper.dart';
import 'package:municipium/services/network/dto/self_payment_dto.dart';
import 'package:pine/pine.dart';

class SelfPaymentMapper extends DTOMapper<SelfPaymentDTO, SelfPayment> {
  @override
  SelfPayment fromDTO(SelfPaymentDTO dto) {
    PaymentTypeMapper paymentTypeMapper = PaymentTypeMapper();
    List<PaymentType> list = [];
    if (dto.tipoPagamenti != null) {
      for (var type in dto.tipoPagamenti!) {
        list.add(paymentTypeMapper.fromDTO(type));
      }
    }
    return SelfPayment(
        area: dto.area,
        areaOrdinamento: dto.areaOrdinamento,
        tipoPagamenti: list,
        success: dto.success);
  }

  @override
  SelfPaymentDTO toDTO(SelfPayment model) {
    return SelfPaymentDTO();
  }
}
