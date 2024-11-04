import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_id_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_url_cubit.dart/municipality_url_cubit.dart';
import 'package:municipium/bloc/cubit/visibility_cubit/visibility_cubit.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/position_utils.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OnboardingSearchMunicipalityPage extends StatelessWidget
    implements AutoRouteWrapper {
  OnboardingSearchMunicipalityPage({super.key});
  final GlobalKey globalKeyTextField = GlobalKey();
  final TextEditingController municipalityController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Municipality> _municipalityList = [];
  @override
  Widget build(BuildContext context) {
    final baseUrlNotifier =
        Provider.of<BaseUrlNotifier>(context, listen: false);
    return Scaffold(
      body: BlocBuilder<MunicipalityBloc, MunicipalityState>(
        builder: (context, municipalityState) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                            AppLocalizations.of(context)!
                                .text_search_municipality,
                            style: Theme.of(context).textTheme.titleLarge),
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
                                context
                                    .read<MunicipalityBloc>()
                                    .filterMunicipalityList(
                                        Provider.of<BaseUrlNotifier>(context,
                                                listen: false)
                                            .baseUrl,
                                        value);
                              } else if (value.isEmpty) {
                                context.read<VisibilityCubit>().hide();
                              }
                            },
                            decoration: InputDecoration(
                              fillColor: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .backgroundColor,
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  Position position =
                                      await PositionUtils.getCurrentPosition();
                                  print(position);
                                  context
                                      .read<MunicipalityBloc>()
                                      .fetchMunicipalityListWithPosition(
                                          Provider.of<BaseUrlNotifier>(context,
                                                  listen: false)
                                              .baseUrl,
                                          position.latitude,
                                          position.longitude);
                                },
                                child: const Icon(
                                  Icons.gps_fixed,
                                  color: Colors.black,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!,
                                ),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!),
                              hintText: "Cerca il tuo comune",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            child: DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context)
                                .bottomNavigationBarTheme
                                .backgroundColor,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!,
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!),
                            ),
                          ),
                          items: const <DropdownMenuItem<int>>[
                            DropdownMenuItem<int>(
                              value: 1,
                              child: Text("Owner"),
                            ),
                            DropdownMenuItem<int>(
                              value: 2,
                              child: Text("Member"),
                            ),
                          ],
                          onChanged: (int? value) {},
                        )),
                        BlocBuilder<VisibilityCubit, VisibilityState>(
                          builder: (context, state) {
                            if (state == VisibilityState.visible) {
                              if (municipalityState
                                  is FetchedFilteredMunicipalityListState) {
                                List<Municipality> _municipalityList =
                                    municipalityState.municipalityList;
                                return Container(
                                  height: _municipalityList.length > 4
                                      ? 240
                                      : (60 * _municipalityList.length)
                                          .toDouble(),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    separatorBuilder: (context, index) =>
                                        Divider(),
                                    shrinkWrap: true,
                                    itemCount: municipalityState
                                        .municipalityList.length,
                                    itemBuilder: (context, index) {
                                      final municipality = municipalityState
                                          .municipalityList[index];
                                      return ListTile(
                                        title: Text(
                                          municipality.municipalityName,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        // Aggiungi qui altre informazioni che vuoi mostrare
                                        onTap: () {
                                          municipalityController.text =
                                              municipality.municipalityName;
                                          context
                                              .read<VisibilityCubit>()
                                              .hide();
                                          context
                                              .read<MunicipalityIdBloc>()
                                              .add(municipality
                                                  .muninicipalityId);
                                          context
                                              .read<MunicipalitySubdomainBloc>()
                                              .add(municipality
                                                  .subdomain);
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
                        Spacer(),
                        FullWidthConfirmButton(
                          isEnabled: false,
                          onTap: () async {
                            await baseUrlNotifier.updateBaseUrl('https://${context.read<MunicipalitySubdomainBloc>().state}/api/v2');
                            context.pushRoute(WelcomeRoute(
                                municipalityId:
                                    context.read<MunicipalityIdBloc>().state));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
          create: (context) => MunicipalityBloc(
              municipalityRepository: context.read())
            ..fetchMunicipalityList(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
        ),
        BlocProvider<VisibilityCubit>(
          create: (context) => VisibilityCubit(),
        ),
        BlocProvider<MunicipalityIdBloc>(
          create: (context) => MunicipalityIdBloc(),
        ),
        BlocProvider<MunicipalitySubdomainBloc>(
          create: (context) => MunicipalitySubdomainBloc(),
        ),
      ], child: this);
}
