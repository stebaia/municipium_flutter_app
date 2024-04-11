import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_id_cubit.dart';
import 'package:municipium/bloc/cubit/visibility_cubit/visibility_cubit.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:municipium/utils/position_utils.dart';

@RoutePage()
class OnboardingSearchMunicipalityPage extends StatelessWidget
    implements AutoRouteWrapper {
  OnboardingSearchMunicipalityPage({super.key});
  final GlobalKey globalKeyTextField = GlobalKey();
  final TextEditingController municipalityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MunicipalityBloc, MunicipalityState>(
        builder: (context, municipalityState) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cerca il tuo comune',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            key: globalKeyTextField,
                            child: TextField(
                              controller: municipalityController,
                              onChanged: (value) {
                                if (value.length >= 3) {
                                  context.read<VisibilityCubit>().show();
                                  context.read<MunicipalityBloc>().filterMunicipalityList(value);
                                } else if (value.isEmpty) {
                                  context.read<VisibilityCubit>().hide();
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () async {
                                    Position position = await PositionUtils
                                        .getCurrentPosition();
                                    print(position);
                                    context
                                        .read<MunicipalityBloc>()
                                        .fetchMunicipalityListWithPosition(
                                            position.latitude,
                                            position.longitude);
                                  },
                                  child: Icon(
                                    Icons.gps_fixed,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(16),
                                border: OutlineInputBorder(
                                  borderRadius: context.watch<VisibilityCubit>().state == VisibilityState.invisible ? BorderRadius.circular(10.0) : const BorderRadius.only(topLeft: Radius.circular(10,), topRight: Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                 borderRadius: context.watch<VisibilityCubit>().state == VisibilityState.invisible ? BorderRadius.circular(10.0) : const BorderRadius.only(topLeft: Radius.circular(10,), topRight: Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: "Cerca il tuo comune",
                              ),
                            ),
                          ),
                          Wrap(
                            children: [
                              BlocBuilder<VisibilityCubit, VisibilityState>(
                                builder: (context, state) {
                                  if (state == VisibilityState.visible) {
                                    
                                        if (municipalityState
                                            is FetchedMunicipalityListState) {
                                          List<Municipality> _municipalityList =
                                              municipalityState.municipalityList;
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10))),
                                            child: ListView.separated(
                                              padding: EdgeInsets.zero,
                                              separatorBuilder:
                                                  (context, index) => Divider(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  municipalityState.municipalityList.length,
                                              itemBuilder: (context, index) {
                                                final municipality = municipalityState
                                                    .municipalityList[index];
                                                return ListTile(
                                                  title: Text(municipality
                                                      .municipalityName),
                                                  // Aggiungi qui altre informazioni che vuoi mostrare
                                                  onTap: () {
                                                    municipalityController.text = municipality.municipalityName;
                                                    context.read<VisibilityCubit>().hide();
                                                    context.read<MunicipalityIdBloc>().add(municipality.muninicipalityId);
                                                    // Gestisci l'evento di tap sul municipio
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Container(); // Potresti mostrare un indicatore di caricamento qui
                                        }
                                    
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          FullWidthConfirmButton(
                            isEnabled: false,
                            onTap: () {
                              context.pushRoute(WelcomeRoute(municipalityId: context.read<MunicipalityIdBloc>().state));
                              
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<MunicipalityBloc>(
          create: (context) =>
              MunicipalityBloc(municipalityRepository: context.read())
                ..fetchMunicipalityList(),
        ),
        BlocProvider<VisibilityCubit>(
          create: (context) => VisibilityCubit(),
        ),
        BlocProvider<MunicipalityIdBloc>(
          create: (context) => MunicipalityIdBloc(),
        ),
      ], child: this);
}
