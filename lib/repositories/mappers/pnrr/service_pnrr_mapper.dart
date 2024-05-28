import 'package:municipium/model/pnrr/service_pnrr.dart';
import 'package:municipium/services/network/dto/service_pnrr_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class ServicePnrrMapper extends DTOMapper<ServicePnrrDTO, ServicePnrr> {
  @override
  ServicePnrr fromDTO(ServicePnrrDTO dto) {
    return ServicePnrr(
        categoria: dto.categoria,
        argomenti: dto.argomenti,
        url: dto.urn,
        title: dto.title,
        shortDescription: dto.shortDescription,
        itemType: dto.itemType,
        sitePageId: dto.sitePageId);
  }

  @override
  ServicePnrrDTO toDTO(ServicePnrr model) {
    return ServicePnrrDTO(
        urn: model.url,
        categoria: model.categoria,
        argomenti: model.argomenti,
        url: model.url,
        sitePageId: model.sitePageId,
        title: model.title,
        itemType: model.itemType,
        shortDescription: model.shortDescription);
  }
}
