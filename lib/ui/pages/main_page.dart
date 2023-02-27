import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';

class MainPage extends StatefulWidget with AutoRouteWrapper {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<MunicipalityBloc>(
          create: (context) =>
              MunicipalityBloc(municipalityRepository: context.read())..fetchMunicipality(8093),
        )
      ], child: this);
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MunicipalityBloc, MunicipalityState>(
        builder: ((context, state) {
      if (state is FetchingMunicipalityState) {
        return const CircularProgressIndicator();
      } else if (state is FetchedMunicipalityState) {
        return Center(
          child: Text('Ho fetchato della roba'),
        );
      } else {
        return Center(
          child: Text('Errore'),
        );
      }
    }));
  }
}
