import 'package:logger/logger.dart';
import 'package:municipium/model/basic_response.dart';
import 'package:municipium/model/ecoattivi/aggiorna_quiz_body.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_foto_azione.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_message.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_missione.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_qr_body.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_qr_response.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz_detail.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/model/ecoattivi/ecostop.dart';
import 'package:municipium/model/ecoattivi/id_to_send.dart';
import 'package:municipium/services/network/api/ecoattivi_service/ecoattivi_service.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_foto_azione_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_message_response.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_missione_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_quiz_detail_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_quiz_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_situazione_utente_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecostop_dto.dart';
import 'package:municipium/services/network/dto/response_dto.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviRepository {
  final DTOMapper<EcoattiviSituazioneUtenteDto, EcoattiviSituazioneUtente>
      situazioneUtenteMapper;
  final DTOMapper<EcoattiviQuizDto, EcoattiviQuiz> quizMapper;
  final DTOMapper<EcoattiviQuizDetailDto, EcoattiviQuizDetail> quizDetailMapper;
  final DTOMapper<EcoattiviFotoAzioneDto, EcoattiviFotoAzione>
      photoActionsMapper;
  final DTOMapper<EcostopDto, Ecostop> ecostopMapper;
  final DTOMapper<EcoattiviMessaggioDto, EcoattiviMessage> messageMapper;
  final DTOMapper<EcoattiviMissioneDto, EcoattiviMissione> missionsMapper;
  final EcoattiviService ecoattiviService;
  final Logger logger;
  final SecureStorage secureStorage;

  EcoattiviRepository(
      {required this.ecoattiviService,
      required this.situazioneUtenteMapper,
      required this.quizMapper,
      required this.quizDetailMapper,
      required this.photoActionsMapper,
      required this.ecostopMapper,
      required this.messageMapper,
      required this.missionsMapper,
      required this.logger,
      required this.secureStorage});

  Future<EcoattiviSituazioneUtente?> getSituazioneUtente(
      String baseUrl, String token, String guid) async {
    try {
      final ResponseDto response =
          await ecoattiviService.verifyToken(baseUrl, token, guid);

      if (response.resultCode == 0) {
        final EcoattiviSituazioneUtenteDto situazioneUtenteResponse =
            await ecoattiviService.situazioneUtente(baseUrl, token, guid);
        final EcoattiviSituazioneUtente situazioneUtente =
            situazioneUtenteMapper.fromDTO(situazioneUtenteResponse);
        return situazioneUtente;
      }
    } catch (error, stackTrace) {
      logger.e('Error in situazione utente: ${error.toString()}');
      rethrow;
    }
  }

  Future<List<EcoattiviQuiz>> getQuizList(
      String baseUrl, String token, String guid) async {
    try {
      final EcoattiviQuizResponse quizListResponse =
          await ecoattiviService.getQuizList(baseUrl, token, guid);
      final List<EcoattiviQuiz> quizList = [];
      if (quizListResponse.quiz != null) {
        for (var element in quizListResponse.quiz!) {
          quizList.add(quizMapper.fromDTO(element));
        }
      }
      return quizList;
    } catch (error, stackTrace) {
      logger.e('Error in quiz list: ${error.toString()}');
      rethrow;
    }
  }

  Future<EcoattiviQuizDetail?> getQuizDetail(
      {required String baseUrl,
      required String token,
      required String guid,
      required int quizId}) async {
    try {
      final EcoattiviQuizDetailReponse quizListResponse =
          await ecoattiviService.getQuizDetail(baseUrl, 'application/json',
              token, guid, IdToSend(quizId: quizId));
      if (quizListResponse.quiz != null) {
        return quizDetailMapper.fromDTO(quizListResponse.quiz!);
      } else {
        logger.e('Error in quiz detail: input null');
      }
    } catch (error, stackTrace) {
      logger.e('Error in quiz detail: ${error.toString()}');
      rethrow;
    }
  }

  Future<bool> updateQuiz(
      {required String baseUrl,
      required String token,
      required String guid,
      required AggiornaQuizBody body}) async {
    try {
      final BasicResponse response = await ecoattiviService.aggiornaQuiz(
          baseUrl, 'application/json', token, guid, body);
      if (response.resultCode == 0) {
        return true;
      } else {
        logger.e('Error in quiz update: input null');
        return false;
      }
    } catch (error, stackTrace) {
      logger.e('Error in quiz update: ${error.toString()}');
      rethrow;
    }
  }

  Future<List<EcoattiviFotoAzione>?> getPhotoActions(
      {required String baseUrl,
      required String token,
      required String guid}) async {
    try {
      final EcoattiviPhotoListReponse response = await ecoattiviService
          .photoActionList(baseUrl, 'application/json', token, guid);
      if (response.resultCode == 0 && response.azioni != null) {
        List<EcoattiviFotoAzione> photos = [];
        for (var azioneDto in response.azioni!) {
          photos.add(photoActionsMapper.fromDTO(azioneDto));
        }
        return photos;
      } else {
        logger.e('Error in photo action: input null');
        return null;
      }
    } catch (error, stackTrace) {
      logger.e('Error in photo action: ${error.toString()}');
      rethrow;
    }
  }

  Future<List<Ecostop>?> getEcostops(
      {required String baseUrl,
      required String token,
      required String guid}) async {
    try {
      final EcostopResponse response = await ecoattiviService.ecostopList(
          baseUrl, 'application/json', token, guid);
      if (response.resultCode == 0 && response.ecostop != null) {
        List<Ecostop> ecostops = [];
        for (var ecostop in response.ecostop!) {
          ecostops.add(ecostopMapper.fromDTO(ecostop));
        }
        return ecostops;
      } else {
        logger.e('Error in ecostops: input null');
        return null;
      }
    } catch (error, stackTrace) {
      logger.e('Error in ecostops: ${error.toString()}');
      rethrow;
    }
  }

  Future<List<EcoattiviMessage>?> getMessages(
      {required String baseUrl,
      required String token,
      required String guid}) async {
    try {
      final EcoattiviMessageResponse response = await ecoattiviService
          .messageList(baseUrl, 'application/json', token, guid);
      if (response.resultCode == 0 && response.messaggi != null) {
        List<EcoattiviMessage> messaggi = [];
        for (var message in response.messaggi!) {
          messaggi.add(messageMapper.fromDTO(message));
        }
        return messaggi;
      } else {
        logger.e('Error in messaggi: input null');
        return null;
      }
    } catch (error, stackTrace) {
      logger.e('Error in messaggi: ${error.toString()}');
      rethrow;
    }
  }

  Future<EcoattiviQrResponse> qrRegistration(
      {required String baseUrl,
      required String token,
      required String guid,
      required EcoattiviQrBody body}) async {
    try {
      final EcoattiviQrResponse response = await ecoattiviService
          .qrRegistration(baseUrl, 'application/json', token, guid, body);
      return response;
    } catch (error, stackTrace) {
      logger.e('Error in messaggi: ${error.toString()}');
      rethrow;
    }
  }

  Future<List<EcoattiviMissione>?> getMissions({
    required String baseUrl,
    required String token,
    required String guid,
  }) async {
    try {
      final EcoattiviMissioniReponse response = await ecoattiviService.missions(
          baseUrl, 'application/json', token, guid);
      if (response.resultCode == 0 && response.sfide != null) {
        List<EcoattiviMissione> missioni = [];
        for (var sfida in response.sfide!) {
          missioni.add(missionsMapper.fromDTO(sfida));
        }
        return missioni;
      } else {
        logger.e('Error in missioni: input null');
        return null;
      }
    } catch (error, stackTrace) {
      logger.e('Error in missioni: ${error.toString()}');
      rethrow;
    }
  }

  Future<String?> get getToken async {
    final json = await secureStorage.getEcoattiviToken();

    return json;
  }
}
