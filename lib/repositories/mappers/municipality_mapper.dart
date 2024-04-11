import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipality_list.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class MunicipalityMapper extends DTOMapper<MunicipalityDTO, Municipality> {
  @override
  Municipality fromDTO(MunicipalityDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    return Municipality(
      municipalityName: dto.name!,
      muninicipalityId: dto.id!,
      logo: dto.logo != null? mapperImages.fromDTO(dto.logo!) : const MunicipiumImage(i1280: '', i300x300: '', baseUrl: '', i720x960: ''),
      background: dto.image != null? mapperImages.fromDTO(dto.image!) : const MunicipiumImage(i1280: '', i300x300: '', baseUrl: '', i720x960: ''),
      subdomain: dto.subdomain != null ? dto.subdomain! : '');
  } 

  @override
  MunicipalityDTO toDTO(Municipality model) => MunicipalityDTO(
        name: model.municipalityName,
        id: model.muninicipalityId,
      );
}

