import 'package:dio/dio.dart';
import 'package:municipium/model/survey/survey.dart';
import 'package:municipium/model/survey/survey_response.dart';
import 'package:retrofit/retrofit.dart';

part 'survey_service.g.dart';


@RestApi()
abstract class SurveyService {
  factory SurveyService(Dio dio) = _SurveyService;

  @GET(
      '{baseUrl}/surveys?archived={isArchived}&udid={udid}')
  Future<List<Survey>> getSurvey(
      @Path('baseUrl') String baseUrl,
      @Path('isArchived') String isArchived,
      @Path('udid') String udid,);

  @GET(
      '{baseUrl}/surveys/{id}')
  Future<SurveyResponse> getSurveyDetail(
      @Path('baseUrl') String baseUrl,
      @Path('id') int id,);

}
