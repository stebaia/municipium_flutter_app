import 'package:municipium/model/issue/issue_tag.dart';
import 'package:municipium/services/network/dto/issue_tag_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class IssueTagMapper extends DTOMapper<IssueTagDto, IssueTag> {
  @override
  IssueTag fromDTO(IssueTagDto dto) {
    return IssueTag(
        id: dto.id!, name: dto.name ?? "", description: dto.description ?? "");
  }

  @override
  IssueTagDto toDTO(IssueTag model) => IssueTagDto();
}
