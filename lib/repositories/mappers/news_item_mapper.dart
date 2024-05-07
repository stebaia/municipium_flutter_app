import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/news_item_list.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/item_category_mapper.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class NewsItemMapper extends DTOMapper<NewsDTO, NewsItemList> {
  @override
  NewsItemList fromDTO(NewsDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    ItemCategoryMapper mapperItemCategory = ItemCategoryMapper();
    List<ItemCategory> itemCategoryList = [];
    for (var element in dto.newsCategories!) {
      itemCategoryList.add(mapperItemCategory.fromDTO(element));
    }
    return NewsItemList(
      id: dto.id!,
      title: dto.title!,
      images: mapperImages.fromDTO(dto.image!),
      newsCategories: itemCategoryList,
      description: dto.excerpt ?? '',
      publishedAt: dto.publishedAt!,
    );


  }
  @override
  NewsDTO toDTO(NewsItemList model) => NewsDTO();
}