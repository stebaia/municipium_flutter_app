import 'package:municipium/model/issue/issue_Detail.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_category_mapper.dart';
import 'package:municipium/services/network/dto/issue_detail_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class IssueDetailMapper extends DTOMapper<IssueDetailDto, IssueDetail> {
  @override
  IssueDetail fromDTO(IssueDetailDto dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    IssueCategoryMapper mapperIssueCategory = IssueCategoryMapper();
    return IssueDetail(
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
        email: dto.email,
        issueCategory: mapperIssueCategory.fromDTO(dto.issueCategory!),
        image: mapperImages.fromDTO(dto.image!),
        image2: mapperImages.fromDTO(dto.image2!),
        image3: mapperImages.fromDTO(dto.image3!),
        image4: mapperImages.fromDTO(dto.image4!));
  }

  @override
  IssueDetailDto toDTO(IssueDetail model) => IssueDetailDto();
}
