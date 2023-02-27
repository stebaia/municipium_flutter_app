part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
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
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),
  Provider<MunicipalityService>(
    create: (context) => MunicipalityService(
      context.read<Dio>(),
      baseUrl: 'https://staging.municipiumapp.it/api/v2/',
    ),
  ),
];