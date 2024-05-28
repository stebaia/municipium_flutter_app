import 'package:municipium/model/issue/issue_category_tag.dart';
import 'package:municipium/services/network/dto/issue_category_tag_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class IssueCategoryTagMapper
    extends DTOMapper<IssueCategoryTagDto, IssueCategoryTag> {
  @override
  IssueCategoryTag fromDTO(IssueCategoryTagDto dto) {
    return IssueCategoryTag(
        id: dto.id!,
        name: dto.name!,
        description: dto.description ?? '',
        mandatoryMessage: dto.mandatoryMessage!,
        isSelectable: dto.isSelectable!,
        tags: dto.tags ?? []);
  }

  @override
  IssueCategoryTagDto toDTO(IssueCategoryTag model) => IssueCategoryTagDto();
}
