import 'package:dio/dio.dart';
import 'package:municipium/model/civil_defence/civil_defence_are_you_ready.dart';
import 'package:municipium/model/civil_defence/civil_defence_level.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'civil_defence_service.g.dart';

@RestApi()
abstract class CivilDefenceService {
  factory CivilDefenceService(Dio dio) = _CivilDefenceService;

  @GET('{baseUrl}/civil_defence_phone_numbers')
  Future<List<CivilDefenceEmergencyCallDTO>> getPhoneNumbers(
      @Path('baseUrl') String baseUrl);

  @GET('{baseUrl}/civil_defence_alerts_levels?type={type}')
  Future<CivilDefenceLevels> getCivilDefenceLevels(
      @Path('baseUrl') String baseUrl, @Path('type') String type);

  @GET('{baseUrl}/civil_defence_risks')
  Future<List<CivilDefenceAreYouReady>> getCivilDefenceAreYouReady(
    @Path('baseUrl') String baseUrl,
  );
}
