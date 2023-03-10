import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'municipality_service.g.dart';

@RestApi()
abstract class MunicipalityService {
  factory MunicipalityService(Dio dio, {String baseUrl}) = _MunicipalityService;

  @GET('municipalities/show_mobile/{municipalityId}')
  Future<MunicipalityDTO> getMunicipality(
      @Path('municipalityId') int municipalityId);
}
