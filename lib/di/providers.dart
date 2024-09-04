part of 'dependency_injector.dart';

List<SingleChildWidget> providersFun({required String baseUrl}) {
  List<SingleChildWidget> providers = [];

  String baseUrlBe = "https://api.municipiumapp.it/";
  String baseUrlGastone = "https://staging.municipiumapp.it/api/gastone/";
  String baseUrlMmc = "https://mmc.maggiolicloud.it/";

  return [
    Provider<LocalAuthentication>(
      create: (_) => LocalAuthentication(),
    ),
    

    Provider<Logger>(
      create: (_) => Logger(),
    ),
    if (kDebugMode)
      Provider<PrettyDioLogger>(
        create: (_) => PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          compact: true,
        ),
      ),
    Provider<Dio>(
      create: (context) => Dio()
        ..interceptors.addAll([
          if (kDebugMode) context.read<PrettyDioLogger>(),
        ]),
    ),
    Provider<MunicipalityService>(
      create: (context) => MunicipalityService(
        context.read<Dio>(),
        baseUrl: baseUrl,
      ),
    ),
    Provider<NewsService>(
      create: (context) => NewsService(
        context.read<Dio>(),
        baseUrl: baseUrl,
      ),
    ),
    Provider<EventService>(
      create: (context) => EventService(
        context.read<Dio>(),
        baseUrl: baseUrl,
      ),
    ),
    Provider<PointOfInterestService>(
      create: (context) => PointOfInterestService(
        context.read<Dio>(),
        baseUrl: baseUrl,
      ),
    ),
    Provider<CivilDefenceService>(
      create: (context) => CivilDefenceService(
        context.read<Dio>(),
        baseUrl: baseUrl,
      ),
    ),
    Provider<MunicipalityConfigurationService>(
      create: (context) => MunicipalityConfigurationService(
        context.read<Dio>(),
      ),
    ),
    Provider<PaymentService>(
      create: (context) => PaymentService(
        context.read<Dio>(),
      ),
    ),
    Provider<MunicipalityBeService>(
      create: (context) =>
          MunicipalityBeService(context.read<Dio>(), baseUrl: baseUrlBe),
    ),
    Provider<IssueService>(
        create: (context) =>
            IssueService(context.read<Dio>(), baseUrl: baseUrl)),
    Provider<PnrrService>(
        create: (context) =>
            PnrrService(context.read<Dio>(), baseUrl: baseUrl)),
    Provider<ReservationsService>(
        create: (context) =>
            ReservationsService(context.read<Dio>(), baseUrl: baseUrlGastone)),
    Provider<AuthSpidService>(
        create: (context) =>
            AuthSpidService(context.read<Dio>(), baseUrl: baseUrl)),
    Provider<MmcMunicipiumService>(
        create: (context) =>
            MmcMunicipiumService(context.read<Dio>(),baseUrl: baseUrlMmc)),
    Provider<OnlineServiceService>(
        create: (context) =>
            OnlineServiceService(context.read<Dio>(),baseUrl: baseUrl))
  ];
}
