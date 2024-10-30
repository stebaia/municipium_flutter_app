part of 'dependency_injector.dart';

List<BlocProvider> _blocs = [
  BlocProvider<MunicipalityGlobalCubit>(
    create: (context) => MunicipalityGlobalCubit(
        municipalityRepository: context.read(), context: context),
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
  BlocProvider<CalendarBloc>(create:(context) => CalendarBloc(calendarEventRepository: context.read()),),
  BlocProvider<FilterCubit>(create: (context) => FilterCubit()) 
];
