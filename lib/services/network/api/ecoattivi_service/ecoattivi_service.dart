import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:municipium/services/network/dto/ecoattivi_quiz_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'ecoattivi_service.g.dart';

@RestApi()
abstract class EcoattiviService {
  factory EcoattiviService(Dio dio) = _EcoattiviService;

  @POST('{baseUrl}/lista_quiz')
  Future<List<EcoattiviQuizDto>> getQuizList(
      @Path('baseUrl') String baseUrl, @Body() String token);
}
