part of 'dependency_injector.dart';

List<SingleChildWidget> providersFun({required String baseUrl}) {
  List<SingleChildWidget> providers = [];

  String baseUrlBe = "https://api.municipiumapp.it/";

  return [
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
    Provider<MunicipalityBeService>(create: (context) => MunicipalityBeService(context.read<Dio>(), baseUrl: baseUrlBe),),
    Provider<IssueService>(
        create: (context) =>
            IssueService(context.read<Dio>(), baseUrl: baseUrl))
  ];
}
