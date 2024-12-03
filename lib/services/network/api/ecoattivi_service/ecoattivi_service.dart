import 'package:dio/dio.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/services/network/dto/ecoattivi_quiz_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi_situazione_utente_dto.dart';
import 'package:municipium/services/network/dto/response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'ecoattivi_service.g.dart';

@RestApi()
abstract class EcoattiviService {
  factory EcoattiviService(Dio dio) = _EcoattiviService;

  @POST('{baseUrl}/lista_quiz')
  Future<List<EcoattiviQuizDto>> getQuizList(@Path('baseUrl') String baseUrl,
      @Header('x_usr_token') String token, @Header('x_app_guid') String guid);

  @POST('{baseUrl}/verifica_token')
  Future<ResponseDto> verifyToken(@Path('baseUrl') String baseUrl,
      @Header('x_usr_token') String token, @Header('x_app_guid') String guid);

  @POST('{baseUrl}/situazione_utente')
  Future<EcoattiviSituazioneUtenteDto> situazioneUtente(
      @Path('baseUrl') String baseUrl,
      @Header('x_usr_token') String token,
      @Header('x_app_guid') String guid);
}
