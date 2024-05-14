import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/category_poi_dto.dart';
import 'package:municipium/services/network/dto/poi_detail_dto.dart';
import 'package:municipium/services/network/dto/point_of_interests_list_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'point_of_interest_service.g.dart';

@RestApi()
abstract class PointOfInterestService {
  factory PointOfInterestService(Dio dio, {String baseUrl}) = _PointOfInterestService;


  @GET('point_of_interests/paged_pois_with_filter?page_index={pageIndex}&page_size={pageSize}')
  Future<PointOfInterestsDTO> getPointOfInterestListPaged(@Path('pageIndex') int pageIndex, @Path('pageSize') int pageSize);

  @GET('point_of_interests/paged_pois_with_filter')
  Future<PointOfInterestsDTO> getPointOfInterestList();

  @GET('point_of_interest_categories/categories_with_poi')
  Future<List<CategoryPoiDTO>> getCategoryPoi();

  @GET('point_of_interests/{poiID}')
  Future<PoiDetailDTO> getDetailPoi(@Path('poiID') int poiID);

}