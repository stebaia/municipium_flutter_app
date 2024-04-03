import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/point_of_interests_item.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/item_category_mapper.dart';
import 'package:municipium/services/network/dto/point_of_interests_list_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PointOfInterestsItemMapper extends DTOMapper<PointOfInterestsItemDTO, PointOfInterestsItem>{
  @override
  PointOfInterestsItem fromDTO(PointOfInterestsItemDTO dto) {
     MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    ItemCategoryMapper mapperItemCategory = ItemCategoryMapper();
    List<ItemCategory> itemCategoryList = [];
    for (var element in dto.pointOfInterestCategories!) {
      itemCategoryList.add(mapperItemCategory.fromDTO(element));
    }
    MunicipiumImage? municipiumImage = null;
    if(dto.image != null){
      municipiumImage = mapperImages.fromDTO(dto.image!);
    }
    return PointOfInterestsItem(id: dto.id, name: dto.name, latitude: dto.latitude, longitude: dto.longitude, address: dto.address, municipality: dto.municipality, municipalityId: dto.municipalityId, pointOfInterestCategories: itemCategoryList, image: municipiumImage);
  }

  @override
  PointOfInterestsItemDTO toDTO(PointOfInterestsItem model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }

}