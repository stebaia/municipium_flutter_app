import 'dart:io';

import 'package:logger/logger.dart';
import 'package:municipium/model/survey/question_response.dart';
import 'package:municipium/model/survey/survey_post_request.dart';
import 'package:municipium/model/survey/survey.dart';
import 'package:municipium/model/survey/survey_post_response.dart';
import 'package:municipium/model/survey/survey_response.dart';
import 'package:municipium/services/network/api/survey_service/survey_service.dart';

class SurveyRepository {
  
  final SurveyService service;
  final Logger logger;

  SurveyRepository(
      {
      required this.service,
      required this.logger});

  Future<List<Survey>> getSurveyList(
      String baseUrl, String type, String udid) async {
    try {

      final surveyListResponse = await service.getSurvey(baseUrl, type, udid);
      List<Survey> list = surveyListResponse;
      return list;
    } catch (error) {
      logger.e('Error in getting survery list');
      rethrow;
    }
  }

  Future<SurveyResponse> getSurveyDetail(
      String baseUrl, int id ) async {
    try {
      
      final surveyResponse = await service.getSurveyDetail(baseUrl, id);
      return surveyResponse;
    } catch (error) {
      logger.e('Error in getting survery list');
      rethrow;
    }
  }

  Future<QuestionResponse> getSurveyQuestions(
      String baseUrl, int id ) async {
    try {
      
      final questionResponse = await service.getSurveyQuestions(baseUrl, id);
      return questionResponse;
    } catch (error) {
      logger.e('Error in getting survery list');
      rethrow;
    }
  }

  Future<SurveyPostResponse> postSurveyVote(
      String baseUrl, int id , SurveyPostRequest surveyPostRequest) async {
    try {
      
      final questionResponse = await service.postSurveyVote(baseUrl, id, surveyPostRequest);
      return questionResponse;
    } catch (error) {
      logger.e('Error in getting survery post vote');
      rethrow;
    }
  }

  
}
