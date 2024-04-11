import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:municipium/ui/components/municipality_components/emergency_call_box.dart';
import 'package:municipium/ui/components/municipality_components/info_municipality_box.dart';
import 'package:municipium/ui/components/municipality_components/last_update_box.dart';

@RoutePage()
class WelcomePage extends StatefulWidget implements AutoRouteWrapper {
  const WelcomePage({super.key, required this.municipalityId});
  final int municipalityId;
  @override
  State<WelcomePage> createState() => _WelcomePageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<MunicipalityBloc>(
          create: (context) =>
              MunicipalityBloc(municipalityRepository: context.read())
                ..fetchMunicipality(municipalityId),
        )
      ], child: this);
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MunicipalityBloc, MunicipalityState>(
          builder: ((context, state) {
        if (state is FetchingMunicipalityState) {
          return const CircularProgressIndicator();
        } else if (state is FetchedMunicipalityState) {
          Municipality municipality = state.municipality;
          return Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    '${municipality.background.baseUrl}${municipality.background.i1280}',
                    fit: BoxFit.cover,
                  )),
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        StaggeredGrid.count(
                          crossAxisCount: 6,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 10,
                          children: [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 3,
                              child: InfoMunicipalityBox(municipality: municipality,)
                            ),
                            const StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 3,
                              child:  EmergencyCallBox()
                            ),
                            const StaggeredGridTile.count(
                              crossAxisCellCount: 6,
                              mainAxisCellCount: 3,
                              child:  LastUpdateBox()
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        FullWidthConfirmButton(isEnabled: true, onTap: (){}, text: 'Entra in Municipium',)
                      ],
                    ),
                  ),
                  
                ],
              )
            ],
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
