import 'package:dio/dio.dart';
import 'package:municipium/model/survey/question_response.dart';
import 'package:municipium/model/survey/survey_post_request.dart';
import 'package:municipium/model/survey/survey.dart';
import 'package:municipium/model/survey/survey_post_response.dart';
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

  @GET(
      '{baseUrl}/surveys/{id}/get_questions')
  Future<QuestionResponse> getSurveyQuestions(
      @Path('baseUrl') String baseUrl,
      @Path('id') int id,);

  @POST('{baseUrl}/surveys/{id}/vote') 
  Future<SurveyPostResponse> postSurveyVote(
    @Path('baseUrl') String baseUrl,
    @Path('id') int id,
    @Body() SurveyPostRequest surveyPostRequest,
  );

 

  
}
