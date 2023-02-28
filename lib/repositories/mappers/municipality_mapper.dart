import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:pine/utils/mapper.dart';

class MunicipalityMapper extends DTOMapper<MunicipalityDTO, Municipality> {
  @override
  Municipality fromDTO(MunicipalityDTO dto) => Municipality(
      municipalityName: dto.name!,
      muninicipalityId: dto.id!,
      subdomain: dto.subdomain!);

  @override
  MunicipalityDTO toDTO(Municipality model) => MunicipalityDTO(
        name: model.municipalityName,
        id: model.muninicipalityId,
      );
}
