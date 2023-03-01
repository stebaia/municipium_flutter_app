import 'package:municipium/model/event_item_list.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/news_detail.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/item_category_mapper.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:pine/utils/mapper.dart';

class NewsDetailMapper extends DTOMapper<NewsDTO, NewsDetail> {
  @override
  NewsDetail fromDTO(NewsDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    ItemCategoryMapper mapperItemCategory = ItemCategoryMapper();
    List<ItemCategory> itemCategoryList = [];
    List<MunicipiumImage> newsDetailImage = [];

    for (var element in dto.newsCategories!) {
      itemCategoryList.add(mapperItemCategory.fromDTO(element));
    }

    for(var element in dto.images!){
      newsDetailImage.add(mapperImages.fromDTO(element));
    }
    
    return NewsDetail(
      id: dto.id!,
      title: dto.title!,
      image: mapperImages.fromDTO(dto.image!),
      newsCategories: itemCategoryList,
      publishedAt: dto.publishedAt!,
      images: newsDetailImage,
      galleryId: dto.galleryId,
      address: dto.address,
      content: dto.content!,
      attachments: dto.attachments,
      slug: dto.slug!, 
      civilDefenceAlerts: dto.civilDefenceAlerts
    );
  }

  @override
  NewsDTO toDTO(NewsDetail model) => NewsDTO();
}