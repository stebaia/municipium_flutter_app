import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:municipium/services/network/dto/new_menu_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class MunicipalityMapper extends DTOMapper<MunicipalityDTO, Municipality> {
  @override
  Municipality fromDTO(MunicipalityDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    return Municipality(
        municipalityName: dto.name!,
        muninicipalityId: dto.id!,
        lat: dto.latitude ?? 0,
        lng: dto.longitude ?? 0,
        appServiceOne: dto.appService1 ?? '',
        appServiceTwo: dto.appService2 ?? '',
        appServiceThree: dto.appService3 ?? '',
        appServiceFour: dto.appService4 ?? '',
        logo: dto.logo != null
            ? mapperImages.fromDTO(dto.logo!)
            : const MunicipiumImage(
                i1280: '',
                i300x300: '',
                baseUrl: '',
                i720x960: '',
                i1920x1280: ''),
        background: dto.image != null
            ? mapperImages.fromDTO(dto.image!)
            : const MunicipiumImage(
                i1280: '',
                i300x300: '',
                baseUrl: '',
                i720x960: '',
                i1920x1280: ''),
        subdomain: dto.subdomain != null ? dto.subdomain! : '',
        newMenu: dto.newMenu ?? NewMenuDTO());
  }

  @override
  MunicipalityDTO toDTO(Municipality model) => MunicipalityDTO(
        name: model.municipalityName,
        id: model.muninicipalityId,
      );
}
