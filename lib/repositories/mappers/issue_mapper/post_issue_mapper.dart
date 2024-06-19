import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/services/network/dto/post_issue_dto.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:pine/utils/dto_mapper.dart';

class PostIssueMapper extends DTOMapper<PostIssueDto, ProgressIssue> {
  @override
  ProgressIssue fromDTO(PostIssueDto dto) {
    return ProgressIssue();
  }

  @override
  PostIssueDto toDTO(ProgressIssue model) {
    return PostIssueDto(
        udid: model.udid,
        userAgent: model.userAgent,
        issue: IssueContentDto(
          municipalityId: int.parse(model.municipalityId ?? '0'),
          municipalityName: model.municipalityName,
          latitude: model.latitude,
          longitude: model.longitude,
          address: model.address,
          content: model.content,
          phone: model.phone,
          name: model.name,
          surname: model.surname,
          email: model.email,
          issueCategoryId: model.issueSubCategoryId ?? model.issueCategoryId,
          image1: createImageToSend(model.image1),
          image2: createImageToSend(model.image2),
          image3: createImageToSend(model.image3),
          image4: createImageToSend(model.image4),
        ));
  }

  ImageIssueDto createImageToSend(String? base64) {
    String name = MunicipiumUtility.getDateForName();
    return ImageIssueDto(
        file: base64, filename: '$name.png', originalFilename: name);
  }
}
