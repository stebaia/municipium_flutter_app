import 'package:dio/dio.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'ecoattivi_service.g.dart';

@RestApi()
abstract class EcoattiviService {
  factory EcoattiviService(Dio dio) = _EcoattiviService;

  @POST('{baseUrl}/lista_quiz')
  Future<List<EcoattiviQuiz>> getQuizList(
      @Path('baseUrl') String baseUrl, @Header('x_usr_token') String token);

  @POST('{baseUrl}/verifica_token')
  Future<void> verifyToken(
      @Path('baseUrl') String baseUrl, @Header('x_usr_token') String token);

  @POST('{baseUrl}/situazione_utente')
  Future<EcoattiviSituazioneUtente> situazioneUtente(
      @Path('baseUrl') String baseUrl, @Header('x_usr_token') String token);
}
