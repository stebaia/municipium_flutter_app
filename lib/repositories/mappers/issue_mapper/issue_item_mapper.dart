import 'package:municipium/model/issue/issue_item_list.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_category_mapper.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/issue_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class IssueItemMapper extends DTOMapper<IssueDto, IssueItemList> {
  @override
  IssueItemList fromDTO(IssueDto dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    IssueCategoryMapper mapperIssueCategory = IssueCategoryMapper();
    return IssueItemList(
        id: dto.id!,
        content: dto.content!,
        latitude: dto.latitude!,
        longitude: dto.longitude!,
        stato: dto.stato!,
        merged: dto.merged!,
        address: dto.address!,
        closed: dto.closed!,
        archived: dto.archived!,
        started: dto.started!,
        canceled: dto.canceled!,
        createdAt: dto.createdAt!,
        issueCategory: mapperIssueCategory.fromDTO(dto.issueCategory!),
        image: mapperImages.fromDTO(dto.image!),
        image2: mapperImages.fromDTO(dto.image2!),
        image3: mapperImages.fromDTO(dto.image3!),
        image4: mapperImages.fromDTO(dto.image4!));
  }

  @override
  IssueDto toDTO(IssueItemList model) => IssueDto();
}
