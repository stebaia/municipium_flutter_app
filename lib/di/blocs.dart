part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<MunicipalityGlobalCubit>(
    create: (context) => MunicipalityGlobalCubit(
        municipalityRepository: context.read(), context: context)
      ..checkMunicipalityGlobalState(),
  ),
  BlocProvider<IssueCubit>(
    create: (context) => IssueCubit(issuesRepository: context.read()),
  ),
  BlocProvider<ThemeCubit>(create: (_) => ThemeCubit())
];
