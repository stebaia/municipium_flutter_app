import 'package:dio/dio.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/municipality_list.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'municipality_service.g.dart';

@RestApi()
abstract class MunicipalityService {
  factory MunicipalityService(Dio dio, {String baseUrl}) = _MunicipalityService;

  @GET('municipalities/')
  Future<List<MunicipalityDTO>> getListMunicipality();

  @GET('municipalities/all=true&latitude={lat}&longitude={lng}&radius=50000')
  Future<List<MunicipalityDTO>> getListMunicipalityWithLatLng(
      @Path('lat') double lat, @Path('lng') double lng);

  @GET('municipalities/show_mobile/{municipalityId}')
  Future<MunicipalityDTO> getMunicipality(
      @Path('municipalityId') int municipalityId);

  @GET('get_idps')
  Future<MunicipalityDTO> getIdpList();

  @GET('paged_municipalities?page_index={page_index}&page_size={page_size}')
  Future<MunicipalityListDTO> getMunicipalityListPaged(
    @Path('page_index') int pageIndex, @Path('page_size') int pageSize
  );

  @GET('municipalities_by_name?municipality_name={municipality_name}')
  Future<List<MunicipalityDTO>> getMunicipalityListFilterByName(
    @Path('municipality_name') String municipalityName, 
  );
}
