part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<MunicipalityRepository>(
      create: (context) => MunicipalityRepository(
          configurationsMapper: context.read(),
          munMapper: context.read(),
          deviceMapper: context.read(),
          configurationService: context.read(),
          municipalityBeService: context.read(),
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
          logger: context.read(),
          eventDetailMapper: context.read())),
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
        issueDetailMapper: context.read(),
        issueTagMapper: context.read(),
        issueCategoryTagMapper: context.read(),
        issueService: context.read(),
        postIssueMapper: context.read(),
        logger: context.read()),
  ),
  RepositoryProvider<UserRepository>(
      create: (context) => UserRepository(
          mmcMunicipiumService: context.read(),
          authSpidService: context.read(),
          municipalityRepository: context.read(),
          secureStorage: context.read())),
  RepositoryProvider<PnrrServiceRepository>(
    create: (context) => PnrrServiceRepository(
        pnrrMapper: context.read(),
        pnrrBodyMapper: context.read(),
        pnrrService: context.read(),
        logger: context.read()),
  ),
  RepositoryProvider<ReservationsRepository>(
    create: (context) => ReservationsRepository(
        resarvableUnitsMapper: context.read(),
        service: context.read(),
        logger: context.read()),
  ),
  RepositoryProvider<OnlineServiceRepository>(
    create: (context) => OnlineServiceRepository(
        onlineServiceService: context.read(),
        logger: context.read()),
  ),
  RepositoryProvider<PaymentsRepository>(
    create: (context) => PaymentsRepository(
        selfPaymentsMapper: context.read(),
        paymentService: context.read(),
        logger: context.read()),
  )
];
