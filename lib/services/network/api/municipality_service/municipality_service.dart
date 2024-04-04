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

  @GET('municipalities/')
  Future<List<MunicipalityDTO>> getListMunicipality();

  @GET('municipalities/all=true&latitude={lat}&longitude={lng}&radius=50000')
  Future<List<MunicipalityDTO>> getListMunicipalityWithLatLng(
      @Path('lat') double lat, @Path('lng') double lng);
  
}
