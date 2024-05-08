import 'package:logger/logger.dart';
import 'package:municipium/model/point_of_intertests_list.dart';
import 'package:municipium/services/network/api/point_of_intertest_service/point_of_interest_service.dart';
import 'package:municipium/services/network/dto/category_poi_dto.dart';
import 'package:municipium/services/network/dto/point_of_interests_list_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PointOfInterestRepository {
  final DTOMapper<PointOfInterestsDTO, PointOfInterestsList> pointOfInterestMapper;
  final PointOfInterestService pointOfInterestService;
  final Logger logger;

  PointOfInterestRepository(
      {required this.logger,
      required this.pointOfInterestService,
      required this.pointOfInterestMapper});

  Future<PointOfInterestsList> getPointOfInterestList(int pageIndex, int pageSize,) async {
    try {
      final pointOfInterestsListResponse =
          await pointOfInterestService.getPointOfInterestList();
      final pointOfInterestsList = pointOfInterestMapper.fromDTO(pointOfInterestsListResponse);
      return pointOfInterestsList;
    } catch (error) {
      logger.e('Error in getting news list');
      rethrow;
    }
  }

  Future<List<CategoryPoiDTO>> getCategoryPoiList() async {
    try {
      final categoryPoi = await pointOfInterestService.getCategoryPoi();
      return categoryPoi;
    }catch (error) {
      logger.e('Error getting category poi');
      rethrow;
    }
  }
}