import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipality_list.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class MunicipalityMapper extends DTOMapper<MunicipalityDTO, Municipality> {
  @override
  Municipality fromDTO(MunicipalityDTO dto) => Municipality(
      municipalityName: dto.name!,
      muninicipalityId: dto.id!,
      subdomain: dto.subdomain != null ? dto.subdomain! : '');

  @override
  MunicipalityDTO toDTO(Municipality model) => MunicipalityDTO(
        name: model.municipalityName,
        id: model.muninicipalityId,
      );
}

