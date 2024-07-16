import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/issue_category_tag_dto.dart';
import 'package:municipium/services/network/dto/issue_dto.dart';
import 'package:municipium/services/network/dto/issue_tag_dto.dart';
import 'package:municipium/services/network/dto/post_issue_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'issue_service.g.dart';

@RestApi()
abstract class IssueService {
  factory IssueService(Dio dio, {String baseUrl}) = _IssueService;

  @GET('issues/{issueId}')
  Future<IssueDto> getIssueDetail(@Path('issueId') int issueId);

  @GET('issues?udid={udid}')
  Future<List<IssueDto>> getIssuesList(@Path('udid') String udid);

  @GET('tags/')
  Future<List<IssueTagDto>> getIssueTags();

  @GET('issue_categories/')
  Future<List<IssueCategoryTagDto>> getIssueCategoriesTags();

  @POST('issues')
  Future<Map<String, bool>> postIssue(@Body() PostIssueDto issue);
}
