import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'base_municipality_service.g.dart';

@RestApi()
abstract class BaseMunicipalityService {
  factory BaseMunicipalityService(Dio dio, {String baseUrl}) = _BaseMunicipalityService;

  @GET('municipalities/')
  Future<List<MunicipalityDTO>> getListMunicipality();

  @GET('municipalities/all=true&latitude={lat}&longitude={lng}&radius=50000')
  Future<List<MunicipalityDTO>> getListMunicipalityWithLatLng(
      @Path('lat') double lat, @Path('lng') double lng);
  
}
