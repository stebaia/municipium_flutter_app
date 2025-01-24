import 'package:dio/dio.dart';
import 'package:municipium/model/basic_response.dart';
import 'package:municipium/model/ecoattivi/aggiorna_quiz_body.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_qr_body.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_qr_response.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/model/ecoattivi/id_to_send.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_foto_azione_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_message_response.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_missione_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_movimento_utente.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_quiz_detail_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_quiz_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_ranking_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_situazione_utente_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecostop_dto.dart';
import 'package:municipium/services/network/dto/response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'ecoattivi_service.g.dart';

@RestApi()
abstract class EcoattiviService {
  factory EcoattiviService(Dio dio) = _EcoattiviService;
  static const String TOKEN = 'x_usr_token';
  static const String GUID = 'x_app_guid';

  @POST('{baseUrl}/lista_quiz')
  Future<EcoattiviQuizResponse> getQuizList(@Path('baseUrl') String baseUrl,
      @Header(TOKEN) String token, @Header(GUID) String guid);

  @POST('{baseUrl}/verifica_token')
  Future<ResponseDto> verifyToken(@Path('baseUrl') String baseUrl,
      @Header(TOKEN) String token, @Header(GUID) String guid);

  @POST('{baseUrl}/situazione_utente')
  Future<EcoattiviSituazioneUtenteDto> situazioneUtente(
      @Path('baseUrl') String baseUrl,
      @Header(TOKEN) String token,
      @Header(GUID) String guid);

  @POST('{baseUrl}/dettagli_quiz')
  Future<EcoattiviQuizDetailReponse> getQuizDetail(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid,
      @Body() IdToSend quizId);

  @POST('{baseUrl}/aggiorna_quiz')
  Future<BasicResponse> aggiornaQuiz(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid,
      @Body() AggiornaQuizBody body);

  @POST('{baseUrl}/lista_foto_azioni')
  Future<EcoattiviPhotoListReponse> photoActionList(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid);

  @POST('{baseUrl}/lista_ecostop')
  Future<EcostopResponse> ecostopList(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid);

  @POST('{baseUrl}/lista_messaggi')
  Future<EcoattiviMessageResponse> messageList(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid);

  @POST('{baseUrl}/registrazione_qr')
  Future<EcoattiviQrResponse> qrRegistration(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid,
      @Body() EcoattiviQrBody body);

  @POST('{baseUrl}/lista_sfide')
  Future<EcoattiviMissioniReponse> missions(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid);

  @POST('{baseUrl}/ranking')
  Future<EcoattiviRankingDto> ranking(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid);

  @POST('{baseUrl}/movimenti_utente')
  Future<EcoattiviMovimentoUtenteResponse> movimentiUtente(
      @Path('baseUrl') String baseUrl,
      @Header('Content-Type') String contentType,
      @Header(TOKEN) String token,
      @Header(GUID) String guid);
}
