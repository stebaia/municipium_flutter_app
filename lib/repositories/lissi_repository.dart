import 'package:logger/logger.dart';
import 'package:municipium/model/lissi/lissi_card_info.dart';
import 'package:municipium/model/lissi/lissi_presentation_template_info.dart';
import 'package:municipium/model/lissi/presentation_session.dart';
import 'package:municipium/model/lissi/prestenation_lissi_template.dart';
import 'package:municipium/services/network/api/lissi_service/lissi_service.dart';
import 'package:municipium/utils/secure_storage.dart';

class LissiRepository {
  final LissiService service;
  final Logger logger;
  final SecureStorage secureStorage;

  LissiRepository(
      {required this.secureStorage,
      required this.service,
      required this.logger});

  Future<void> getAuthToken() async {
    try {
      final tokenResponse = await service.getToken(
        clientId: 'maggioli',
        clientSecret: 'ymYreIgeJgHAl8Y1aTVlWXRYc4lkpdJr',
        grantType: 'client_credentials',
        resource: 'api://6b1a8ded-7844-4eb6-8d56-b38b8829141f',
      );
      if (tokenResponse.accessToken == null) {
        throw Exception('Error in getting lissi token');
      }
      secureStorage.setLissiTokenKeyInStorage(tokenResponse.accessToken!);
    } catch (error) {
      logger.e('Error in getting lissi token');
      rethrow;
    }
  }

  Future<List<PrestenationLissiTemplateContent>>
      getPresentationTemplates() async {
    try {
      final presentationTemplatesResponse =
          await service.getPresentationTemplates();
      final List<PrestenationLissiTemplateContent> presentationTemplates = [];
      if (presentationTemplatesResponse.content != null) {
        for (var element in presentationTemplatesResponse.content!) {
          presentationTemplates.add(element);
        }
      }

      return presentationTemplates;
    } catch (error) {
      logger.e('Error in getting presentation templates');
      rethrow;
    }
  }

  Future<LissiPresentationSession> getPresentationSession(
      LissiPresentationTemplateInfo lissiPresentationSession) async {
    try {
      final presentationSessionResponse =
          await service.postPresentationSession(lissiPresentationSession);
      if (presentationSessionResponse.response.statusCode! ~/ 100 == 2) {
        return presentationSessionResponse.data;
      } else {
        throw Exception('Error in getting presentation session');
      }
    } catch (error) {
      logger.e('Error in getting presentation templates');
      rethrow;
    }
  }

  Future<LissiCardInfo> confirmPresentationSession(String presentationSessionId) async {
    try {
      final presentationSessionResponse =
          await service.confirmPresentationSession(presentationSessionId);
      if (presentationSessionResponse.response.statusCode! ~/ 100 == 2) {
        return presentationSessionResponse.data;
      } else {
        throw Exception('Error in getting presentation session');
      }
    } catch (error) {
      logger.e('Error in getting presentation templates');
      rethrow;
    }
  }

  Future<String?> getLissiTokenKeyFromStorage() async {
    try {
      return await secureStorage.getLissiTokenKeyFromStorage();
    } catch (e) {
      throw Exception(e);
    }
  }
}
