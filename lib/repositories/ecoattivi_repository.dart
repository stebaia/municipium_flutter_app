import 'package:logger/logger.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/services/network/api/ecoattivi_service/ecoattivi_service.dart';
import 'package:municipium/services/network/dto/ecoattivi_quiz_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi_situazione_utente_dto.dart';
import 'package:municipium/services/network/dto/response_dto.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviRepository {
  final DTOMapper<EcoattiviSituazioneUtenteDto, EcoattiviSituazioneUtente>
      situazioneUtenteMapper;
  final DTOMapper<EcoattiviQuizDto, EcoattiviQuiz> quizMapper;
  final EcoattiviService ecoattiviService;
  final Logger logger;
  final SecureStorage secureStorage;

  EcoattiviRepository(
      {required this.ecoattiviService,
      required this.situazioneUtenteMapper,
      required this.quizMapper,
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
      final List<EcoattiviQuizDto> quizListResponse =
          await ecoattiviService.getQuizList(baseUrl, token, guid);
      final List<EcoattiviQuiz> quizList = [];
      if (quizListResponse != null) {
        for (var element in quizListResponse) {
          quizList.add(quizMapper.fromDTO(element));
        }
      }
      return quizList;
    } catch (error, stackTrace) {
      logger.e('Error in quiz list: ${error.toString()}');
      rethrow;
    }
  }

  Future<String?> get getToken async {
    final json = await secureStorage.getEcoattiviToken();

    return json;
  }
}
