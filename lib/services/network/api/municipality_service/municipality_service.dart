import 'package:dio/dio.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'municipality_service.g.dart';

@RestApi()
abstract class MunicipalityService {
  factory MunicipalityService(Dio dio) = _MunicipalityService;

  @GET('{baseUrl}/municipalities/')
  Future<List<MunicipalityDTO>> getListMunicipality(
      @Path('baseUrl') String baseUrl);

  @GET(
      '{baseUrl}/municipalities/all=true&latitude={lat}&longitude={lng}&radius=50000')
  Future<List<MunicipalityDTO>> getListMunicipalityWithLatLng(
      @Path('baseUrl') String baseUrl,
      @Path('lat') double lat,
      @Path('lng') double lng);

  @GET('{baseUrl}/municipalities/show_mobile/{municipalityId}')
  Future<MunicipalityDTO> getMunicipality(@Path('baseUrl') String baseUrl,
      @Path('municipalityId') int municipalityId);

  @GET('{baseUrl}/get_idps')
  Future<MunicipalityDTO> getIdpList(@Path('baseUrl') String baseUrl);
}
