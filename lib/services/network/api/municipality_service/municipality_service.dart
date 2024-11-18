import 'package:dio/dio.dart';
import 'package:municipium/model/dashboard_menu/dashboard_menu.dart';
import 'package:municipium/model/municipality_list.dart';
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

  @GET(
      '{baseUrl}/paged_municipalities?page_index={page_index}&page_size={page_size}')
  Future<MunicipalityListDTO> getMunicipalityListPaged(
      @Path('baseUrl') String baseUrl,
      @Path('page_index') int pageIndex,
      @Path('page_size') int pageSize);

  @GET('{baseUrl}/municipalities_by_name?municipality_name={municipality_name}')
  Future<List<MunicipalityDTO>> getMunicipalityListFilterByName(
    @Path('baseUrl') String baseUrl,
    @Path('municipality_name') String municipalityName,
  );

  @GET('{baseUrl}/municipalities/dashboard_mobile/{municipality_id}')
  Future<List<DashboardMenu>> getMunicipalityDashboard(
      @Path('baseUrl') String baseUrl,
      @Path('municipality_id') String municipalityId);
}
