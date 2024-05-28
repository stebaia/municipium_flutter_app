import 'package:municipium/model/issue/issue_category.dart';
import 'package:municipium/services/network/dto/issue_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class IssueCategoryMapper extends DTOMapper<IssueCategoryDTO, IssueCategory> {
  @override
  IssueCategory fromDTO(IssueCategoryDTO dto) {
    return IssueCategory(id: dto.id!, name: dto.name!);
  }

  @override
  IssueCategoryDTO toDTO(IssueCategory model) =>
      IssueCategoryDTO(name: model.name, id: model.id);
}
