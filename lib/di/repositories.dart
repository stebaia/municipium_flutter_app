part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<MunicipalityRepository>(
      create: (context) => MunicipalityRepository(
          municipalityService: context.read(),
          municipalityMapper: context.read(),
          logger: context.read()))
];
