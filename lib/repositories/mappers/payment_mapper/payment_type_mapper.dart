import 'package:municipium/model/payment/payment_type.dart';
import 'package:municipium/services/network/dto/self_payment_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PaymentTypeMapper extends DTOMapper<PaymentTypeDTO, PaymentType> {
  @override
  PaymentType fromDTO(PaymentTypeDTO dto) {
    return PaymentType(
        descrizione: dto.descrizione,
        mod3: dto.mod3,
        codiceDebitoJppa: dto.codiceDebitoJppa,
        codice: dto.codice,
        codiceTributo: dto.codiceTributo,
        mod1: dto.mod1);
  }

  @override
  PaymentTypeDTO toDTO(PaymentType model) {
    throw PaymentTypeDTO();
  }
}
