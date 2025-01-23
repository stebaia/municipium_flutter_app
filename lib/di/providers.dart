part of 'dependency_injector.dart';

List<SingleChildWidget> providersFun() {
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
    Provider<SecureStorage>(create: (_) => SecureStorage()),
    ChangeNotifierProvider<BaseUrlNotifier>(
      lazy: false,
      create: (context) {
        return BaseUrlNotifier()..initializeBaseUrl(BaseUrlType.staging);
      },
    ),

    Provider<MunicipalityService>(
      create: (context) {
        return MunicipalityService(
          context.read<Dio>(),
        );
      },
    ),

    Provider<NewsService>(
      create: (context) => NewsService(
        context.read<Dio>(),
      ),
    ),
    Provider<EventService>(
      create: (context) => EventService(
        context.read<Dio>(),
      ),
    ),
    Provider<PointOfInterestService>(
      create: (context) => PointOfInterestService(
        context.read<Dio>(),
      ),
    ),
    Provider<CivilDefenceService>(
      create: (context) => CivilDefenceService(
        context.read<Dio>(),
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
          MunicipalityBeService(context.read<Dio>()), //baseUrlBe
    ),
    Provider<IssueService>(
        create: (context) => IssueService(context.read<Dio>())), //baseUrl
    Provider<PnrrService>(
        create: (context) => PnrrService(context.read<Dio>())), //baseUrl
    Provider<ReservationsService>(
        create: (context) =>
            ReservationsService(context.read<Dio>())), //baseUrlGastone
    Provider<AuthSpidService>(
        create: (context) => AuthSpidService(context.read<Dio>())),
    Provider<MmcMunicipiumService>(
        create: (context) =>
            MmcMunicipiumService(context.read<Dio>())), //baseUrlMmc
    Provider<OnlineServiceService>(
        create: (context) =>
            OnlineServiceService(context.read<Dio>())), //baseUrl
    Provider<CalendarService>(
        create: (context) => CalendarService(context.read<Dio>())),
    Provider<EcoattiviService>(
        create: (context) => EcoattiviService(context.read<Dio>())),
    Provider<GarbageService>(
        create: (context) => GarbageService(context.read<Dio>())),
    Provider<LissiService>(
        create: (context) => LissiService(
              context.read<Dio>(),
            )),
    Provider<SurveyService>(
        create: (context) => SurveyService(
              context.read<Dio>(),
            )),

    Provider<InfoMunicipalityService>(
        create: (context) => InfoMunicipalityService(
              context.read<Dio>(),
            )),
  ];
}
