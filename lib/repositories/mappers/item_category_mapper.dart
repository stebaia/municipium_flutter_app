import 'package:municipium/model/item_category.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class ItemCategoryMapper extends DTOMapper<ItemCategoryDTO, ItemCategory> {
  @override
  ItemCategory fromDTO(ItemCategoryDTO dto) =>
      ItemCategory(id: dto.id!, name: dto.name!, color: dto.color);

  @override
  ItemCategoryDTO toDTO(ItemCategory model) =>
      ItemCategoryDTO(name: model.name, id: model.id, color: model.color);
}
