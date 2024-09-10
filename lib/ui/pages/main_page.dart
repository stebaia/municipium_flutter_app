import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/repositories/news_repository.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/pages/news_section/news_list_page.dart';


@RoutePage()
class MainPage extends StatefulWidget implements AutoRouteWrapper {
  const MainPage({super.key, required this.municipalityId});
  final int municipalityId;
  @override
  State<MainPage> createState() => _MainPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<MunicipalityBloc>(
          create: (context) =>
              MunicipalityBloc(municipalityRepository: context.read())..fetchMunicipality(municipalityId),
        )
      ], child: this);
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MunicipalityBloc, MunicipalityState>(
          builder: ((context, state) {
        if (state is FetchingMunicipalityState) {
          return const CircularProgressIndicator();
        } else if (state is FetchedMunicipalityState) {
          return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.municipality.municipalityName),
                  
                  MaterialButton(
                    child: Text('get news'),
                    onPressed: (() {
                      context.pushRoute(const NewsListRoute());
                  })),
                  MaterialButton(
                    child: Text('get pois'),
                    onPressed: (() {
                      context.pushRoute(const PointOfInterestListRoute());
                  }))
                ],
              )
            
          );
        } else {
          return Center(
            child: Text('Errore'),
          );
        }
      })),
    );
  }
}
