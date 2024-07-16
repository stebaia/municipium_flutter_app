import 'package:logger/logger.dart';
import 'package:municipium/model/issue/issue_category_tag.dart';
import 'package:municipium/model/issue/issue_item_list.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/issue_tag.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/services/network/api/issue_service/issue_service.dart';
import 'package:municipium/services/network/dto/issue_category_tag_dto.dart';
import 'package:municipium/services/network/dto/issue_dto.dart';
import 'package:municipium/services/network/dto/issue_tag_dto.dart';
import 'package:municipium/services/network/dto/post_issue_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class IssuesRepository {
  final DTOMapper<IssueDto, IssueItemList> issueItemMapper;
  final DTOMapper<IssueTagDto, IssueTag> issueTagMapper;
  final DTOMapper<IssueCategoryTagDto, IssueCategoryTag> issueCategoryTagMapper;
  final DTOMapper<PostIssueDto, ProgressIssue> postIssueMapper;
  final IssueService issueService;
  final Logger logger;

  IssuesRepository(
      {required this.issueItemMapper,
      required this.issueTagMapper,
      required this.issueCategoryTagMapper,
      required this.postIssueMapper,
      required this.issueService,
      required this.logger});

  Future<List<IssueItemList>> getIssuesList(String udid) async {
    try {
      final List<IssueDto> issuesResponse =
          await issueService.getIssuesList(udid);
      final List<IssueItemList> list = [];
      for (var element in issuesResponse) {
        list.add(issueItemMapper.fromDTO(element));
      }
      return list;
    } catch (error, stackTrace) {
      logger.e('Error in getting issues list municipality-object');
      rethrow;
    }
  }

  Future<List<IssueCategoryTag>> getIssueCategoryList() async {
    try {
      final List<IssueCategoryTagDto> issueCategoryTagResponse =
          await issueService.getIssueCategoriesTags();
      final List<IssueCategoryTag> listCategory = [];
      for (var cat in issueCategoryTagResponse) {
        listCategory.add(issueCategoryTagMapper.fromDTO(cat));
      }
      return listCategory;
    } catch (error, stackTrace) {
      logger.e('Error in getting tags categories list');
      rethrow;
    }
  }

  Future<Map<String, bool>> postIssue(PostIssueDto issueDto) async {
    try {
      Map<String, bool> response = await issueService.postIssue(issueDto);
      print(response);
      return response;
    } catch (error, stackTrace) {
      logger.e('Error in getting tags categories list');
      rethrow;
    }
  }

  Future<List<IssueMappedCategory>> getIssueCategoryTagList() async {
    try {
      final List<IssueTagDto> issueTagResponse =
          await issueService.getIssueTags();
      final List<IssueTag> listTag = [];
      final List<IssueCategoryTag> listCategory = await getIssueCategoryList();

      for (var tag in issueTagResponse) {
        listTag.add(issueTagMapper.fromDTO(tag));
      }
      final List<IssueMappedCategory> list = mapModels(listTag, listCategory);
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    } catch (error, stackTrace) {
      logger.e('Error in getting tags categories list');
      rethrow;
    }
  }

  List<IssueCategoryTag>? getListFromTag(int id) {}

  List<IssueMappedCategory> mapModels(
      List<IssueTag> listTag, List<IssueCategoryTag> listCategory) {
    final List<IssueMappedCategory> list = [];
    for (var category in listCategory) {
      if (category.tags.isNotEmpty) {
        for (var catTag in category.tags) {
          if (listTag.isEmpty) {
            list.add(IssueMappedCategory(
                id: category.id,
                name: category.name,
                description: category.description,
                mandatoryMessage: category.mandatoryMessage,
                isSelectable: category.isSelectable));
          } else {
            for (var tag in listTag) {
              if (tag.id == catTag && !list.map((e) => e.id).contains(tag.id)) {
                //se la lista non contiene già quell'elemento (aggiunto in precedenza)
                list.add(IssueMappedCategory(
                    id: tag.id,
                    name: tag.name,
                    description: tag.description,
                    mandatoryMessage: category.mandatoryMessage,
                    isSelectable: true));
              }
            }
          }
        }
      } else {
        list.add(IssueMappedCategory(
            id: category.id,
            name: category.name,
            description: category.description,
            mandatoryMessage: category.mandatoryMessage,
            isSelectable: category.isSelectable));
      }
    }
    return list;
  }
}
