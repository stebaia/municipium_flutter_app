import 'package:municipium/model/ecoattivi/ecoattivi_requisito.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_premio_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviRequisitoMapper
    extends DTOMapper<EcoattiviRequisitoDto, EcoattiviRequisito> {
  @override
  EcoattiviRequisito fromDTO(EcoattiviRequisitoDto dto) {
    return EcoattiviRequisito(
      requisitoId: dto.requisitoId ?? 0,
      requisitoDesc: dto.requisitoDesc ?? '',
      requisitoInfoHtml: dto.requisitoInfoHtml ?? '',
      tipo: dto.tipo ?? 0,
      opzioni: dto.opzioni ?? [],
      obbligatorio: dto.obbligatorio ?? false,
      valore: dto.valore ?? '',
    );
  }

  @override
  EcoattiviRequisitoDto toDTO(EcoattiviRequisito model) {
    return EcoattiviRequisitoDto(
      requisitoId: model.requisitoId,
      requisitoDesc: model.requisitoDesc,
      requisitoInfoHtml: model.requisitoInfoHtml,
      tipo: model.tipo,
      opzioni: model.opzioni,
      obbligatorio: model.obbligatorio,
      valore: model.valore,
    );
  }
}
