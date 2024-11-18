import 'package:municipium/model/payment/field_attribute.dart';
import 'package:municipium/model/payment/payment_custom_field.dart';
import 'package:municipium/repositories/mappers/payment_mapper/field_attribute_mapper.dart';
import 'package:municipium/services/network/dto/payment_response_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PaymentCustomFieldMapper
    extends DTOMapper<PaymentCustomFieldDTO, PaymentCustomField> {
  @override
  PaymentCustomField fromDTO(PaymentCustomFieldDTO dto) {
    FieldAttributeMapper fieldAttributeMapper = FieldAttributeMapper();
    List<FieldAttribute> list = [];
    if (dto.attributi != null) {
      for (var type in dto.attributi!) {
        list.add(fieldAttributeMapper.fromDTO(type));
      }
    }
    return PaymentCustomField(
        tipo: dto.tipo,
        nome: dto.nome,
        label: dto.label,
        defaultVal: dto.defaultVal,
        usaPerCalcoloCaselle: dto.usaPerCalcoloCaselle,
        posizione: dto.posizione,
        usaPerCausaleAutomatica: dto.usaPerCausaleAutomatica,
        usaPerCalcolo: dto.usaPerCalcolo,
        required: dto.required,
        attributi: list);
  }

  @override
  PaymentCustomFieldDTO toDTO(PaymentCustomField model) {
    throw PaymentCustomFieldDTO();
  }
}
