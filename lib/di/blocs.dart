part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<MunicipalityGlobalCubit>(
    create: (context) => MunicipalityGlobalCubit(
        municipalityRepository: context.read(), context: context)
      ..checkMunicipalityGlobalState(),
  ),
];
