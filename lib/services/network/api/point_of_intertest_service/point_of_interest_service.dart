import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/category_poi_dto.dart';
import 'package:municipium/services/network/dto/poi_detail_dto.dart';
import 'package:municipium/services/network/dto/point_of_interests_list_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'point_of_interest_service.g.dart';

@RestApi()
abstract class PointOfInterestService {
  factory PointOfInterestService(Dio dio) = _PointOfInterestService;

  @GET(
      '{baseUrl}/point_of_interests/paged_pois_with_filter?page_index={pageIndex}&page_size={pageSize}')
  Future<PointOfInterestsDTO> getPointOfInterestListPaged(
      @Path('baseUrl') String baseUrl,
      @Path('pageIndex') int pageIndex,
      @Path('pageSize') int pageSize);

  @GET('{baseUrl}/point_of_interests/paged_pois_with_filter')
  Future<PointOfInterestsDTO> getPointOfInterestList(
      @Path('baseUrl') String baseUrl);

  @GET('{baseUrl}/point_of_interest_categories/categories_with_poi')
  Future<List<CategoryPoiDTO>> getCategoryPoi(@Path('baseUrl') String baseUrl);

  @GET('{baseUrl}/point_of_interests/{poiID}')
  Future<PoiDetailDTO> getDetailPoi(
      @Path('baseUrl') String baseUrl, @Path('poiID') int poiID);
}
