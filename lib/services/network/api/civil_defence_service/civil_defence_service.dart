import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'civil_defence_service.g.dart';

@RestApi()
abstract class CivilDefenceService {
  factory CivilDefenceService(Dio dio, {String baseUrl}) = _CivilDefenceService;

  @GET('civil_defence_phone_numbers')
  Future<List<CivilDefenceEmergencyCallDTO>> getPhoneNumbers();
}
