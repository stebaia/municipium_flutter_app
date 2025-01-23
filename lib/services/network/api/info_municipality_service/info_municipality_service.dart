
import 'package:dio/dio.dart';
import 'package:municipium/model/pages/pages.dart';
import 'package:retrofit/retrofit.dart';


part 'info_municipality_service.g.dart';
@RestApi()
abstract class InfoMunicipalityService {
  factory InfoMunicipalityService(Dio dio) = _InfoMunicipalityService;

  @GET('{baseUrl}/pages')
  Future<List<Pages>> getPages(
      @Path('baseUrl') String baseUrl,);

  @GET('{baseUrl}/pages/{id}')
  Future<Pages> getPageDetail(
      @Path('baseUrl') String baseUrl, @Path('id') int id);
  
}


