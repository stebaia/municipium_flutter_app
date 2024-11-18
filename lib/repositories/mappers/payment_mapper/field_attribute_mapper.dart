import 'package:municipium/model/payment/field_attribute.dart';
import 'package:municipium/services/network/dto/payment_response_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class FieldAttributeMapper
    extends DTOMapper<FieldAttributeDTO, FieldAttribute> {
  @override
  FieldAttribute fromDTO(FieldAttributeDTO dto) {
    return FieldAttribute(valore: dto.valore, nome: dto.nome, label: dto.label);
  }

  @override
  FieldAttributeDTO toDTO(FieldAttribute model) {
    throw FieldAttributeDTO();
  }
}
