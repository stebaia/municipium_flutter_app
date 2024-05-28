part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<MunicipalityRepository>(
      create: (context) => MunicipalityRepository(
          munMapper: context.read(),
          secureStorage: context.read(),
          municipalityService: context.read(),
          municipalityMapper: context.read(),
          logger: context.read())),
  RepositoryProvider<NewsRepository>(
      create: (context) => NewsRepository(
          newsDetailMapper: context.read(),
          newsItemMapper: context.read(),
          newsService: context.read(),
          logger: context.read())),
  RepositoryProvider<EventsRepository>(
      create: (context) => EventsRepository(
          eventItemMapper: context.read(),
          eventService: context.read(),
          logger: context.read())),
  RepositoryProvider<PointOfInterestRepository>(
      create: (context) => PointOfInterestRepository(
          pointOfInterestMapper: context.read(),
          pointOfInterestService: context.read(),
          logger: context.read())),
  RepositoryProvider<CivilDefenceRepository>(
      create: (context) => CivilDefenceRepository(
          emergencyCallMapper: context.read(),
          civilDefenceService: context.read(),
          logger: context.read())),
  RepositoryProvider<IssuesRepository>(
    create: (context) => IssuesRepository(
        issueItemMapper: context.read(),
        issueTagMapper: context.read(),
        issueCategoryTagMapper: context.read(),
        issueService: context.read(),
        logger: context.read()),
  )
];
