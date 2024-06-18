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
  Provider<DTOMapper<PointOfInterestsDTO, PointOfInterestsList>>(
    create: (_) => PointOfInterestsListMapper(),
  ),
  Provider<DTOMapper<PointOfInterestsItemDTO, PointOfInterestsItem>>(
    create: (_) => PointOfInterestsItemMapper(),
  ),
  Provider<DTOMapper<CivilDefenceEmergencyCallDTO, CivilDefenceEmergencyCall>>(
    create: (_) => CivilDefenceEmergencyCallMapper(),
  ),
  Provider<DTOMapper<IssueDto, IssueItemList>>(
    create: (_) => IssueItemMapper(),
  ),
  Provider<DTOMapper<IssueTagDto, IssueTag>>(create: (_) => IssueTagMapper()),
  Provider<DTOMapper<IssueCategoryTagDto, IssueCategoryTag>>(
      create: (_) => IssueCategoryTagMapper()),
  Provider<DTOMapper<EventDetailDto, EventDetail>>(
      create: (_) => EventDetailMapper()),
  Provider<DTOMapper<ServicePnrrDTO, ServicePnrr>>(
      create: (_) => ServicePnrrMapper()),
  Provider<DTOMapper<PnrrBodyResponseDto, BodyPnrrResponse>>(
      create: (_) => BodyResponsePnrrMapper()),
  Provider<DTOMapper<ServicePnrrDTO, ServicePnrr>>(
      create: (_) => ServicePnrrMapper()),
  Provider<DTOMapper<PnrrBodyDto, BodyPnrr>>(create: (_) => BodyPnrrMapper()),
  Provider<DTOMapper<ReservableUnitDto, ReservableUnit>>(
      create: (_) => ReservableUnitMapper())
];
