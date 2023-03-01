part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<Mapper<Municipality, String>>(
    create: (_) => MunicipalitySecureMapper(),
  ),
  Provider<DTOMapper<MunicipalityDTO, Municipality>>(
    create: (_) => MunicipalityMapper(),
  ),
  Provider<DTOMapper<NewsDTO, NewsItemList>>(
    create: (_) => NewsItemMapper(),
  ),
  Provider<DTOMapper<ItemCategoryDTO, ItemCategory>>(
    create: (_) => ItemCategoryMapper(),
  ),
  Provider<DTOMapper<MImagesDTO, MunicipiumImage>>(
    create: (_) => MunicipiumImageMapper(),
  ),
  Provider<DTOMapper<EventDTO, EventItemList>>(
    create: (_) => EventItemMapper(),
  ),
  Provider<DTOMapper<NewsDTO, NewsDetail>>(
    create: (_) => NewsDetailMapper(),
  ),
];
