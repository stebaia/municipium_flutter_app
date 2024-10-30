part of 'dependency_injector.dart';

List<BlocProvider> getBlocs(
    BuildContext context, BaseUrlNotifier baseUrlNotifier) {
  // Assicurati che sia disponibile

  return [
    BlocProvider<MunicipalityGlobalCubit>(
      create: (context) => MunicipalityGlobalCubit(
          municipalityRepository: context.read(), context: context)
        ..checkMunicipalityGlobalState(
            baseUrlNotifier.baseUrl, baseUrlNotifier.baseUrlBe),
    ),
    BlocProvider<IssueCubit>(
      create: (context) => IssueCubit(issuesRepository: context.read()),
    ),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
    BlocProvider<TemporaryConfigurationCubit>(
        create: (context) => TemporaryConfigurationCubit(context.read())),
    BlocProvider<UserMenuConfigurationCubit>(
        create: (context) => UserMenuConfigurationCubit(context.read())),
    BlocProvider<DeviceCubit>(create: (context) => DeviceCubit(context.read())),
    BlocProvider<UserDataCubit>(create: (context) => UserDataCubit()),
  ];
}
