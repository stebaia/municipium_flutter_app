import 'package:municipium/model/events/event_item_list.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/item_category_mapper.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EventItemMapper extends DTOMapper<EventDTO, EventItemList> {
  @override
  EventItemList fromDTO(EventDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    ItemCategoryMapper mapperItemCategory = ItemCategoryMapper();
    List<ItemCategory> itemCategoryList = [];
    if (dto.eventCategories != null) {
      for (var element in dto.eventCategories!) {
        itemCategoryList.add(mapperItemCategory.fromDTO(element));
      }
    }

    return EventItemList(
      id: dto.id ?? 0,
      title: dto.title ?? '',
      images: mapperImages.fromDTO(dto.image!),
      eventCategories: itemCategoryList,
      description: dto.excerpt ?? '',
      publishedAt: dto.publishedAt ?? '',
    );
  }

  @override
  EventDTO toDTO(EventItemList model) => EventDTO();
}
