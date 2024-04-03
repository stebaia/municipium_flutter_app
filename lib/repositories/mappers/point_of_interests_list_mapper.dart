import 'package:municipium/model/point_of_interests_item.dart';
import 'package:municipium/model/point_of_intertests_list.dart';
import 'package:municipium/repositories/mappers/point_of_interest_item_mapper.dart';
import 'package:municipium/services/network/dto/point_of_interests_list_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PointOfInterestsListMapper
    extends DTOMapper<PointOfInterestsDTO, PointOfInterestsList> {
  @override
  PointOfInterestsList fromDTO(PointOfInterestsDTO dto) {
    List<PointOfInterestsItem> pointOfInterestsList = [];
    PointOfInterestsItemMapper pointOfInterestsItemMapper =
        PointOfInterestsItemMapper();
    for (var element in dto.result!) {
      pointOfInterestsList.add(pointOfInterestsItemMapper.fromDTO(element));
    }
    return PointOfInterestsList(
        currentPage: dto.currentPage,
        pageSize: dto.pageSize,
        pages: dto.pages,
        totalPoi: dto.totalPoi,
        pointOfInterestsItemList: pointOfInterestsList);
  }

  @override
  PointOfInterestsDTO toDTO(PointOfInterestsList model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}
