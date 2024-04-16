part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
   BlocProvider<MunicipalityBloc>(
    create: (context) =>
        MunicipalityBloc(municipalityRepository: context.read())
          ..checkMunicipalityState(),
  ),
];