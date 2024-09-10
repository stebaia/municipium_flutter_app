import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/user_menu_conf_cubit_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_url_cubit.dart/municipality_url_cubit.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/shimmer_utils.dart';

@RoutePage()
class ChooseMunicipalityPage extends StatelessWidget
    implements AutoRouteWrapper {
  const ChooseMunicipalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = (context.watch<MunicipalityGlobalCubit>().state
        as StoredMunicipalityGlobalState);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!
                .text_list_of_municipality_title
                .toUpperCase(),
            style: const TextStyle(fontSize: 16),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context)!.text_search_municipality,
                  prefixIcon: const Icon(CupertinoIcons.search),
                  suffixIcon: const Icon(CupertinoIcons.radiowaves_left)),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(CupertinoIcons.bubble_left),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(AppLocalizations.of(context)!
                      .text_no_municipality_search),
                  Text(
                    AppLocalizations.of(context)!.text_issue_now,
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Row(
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(CupertinoIcons.bell),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                          '${AppLocalizations.of(context)!.text_notify_from_other_municipality} ${AppLocalizations.of(context)!.text_issue_now}')),
                ],
              ),
            ),
            Divider(),
            BlocConsumer<MunicipalityBloc, MunicipalityState>(
              listener: (context, state) {
                if(state is FetchedMunicipalityState) {
                  context.read<MunicipalityUrlCubit>().fetchMunicipalityInStorage();
                  context.pushRoute(WelcomeRoute(municipalityId: state.municipality.muninicipalityId));
                }
              },
              builder: (context, state) {
                if (state is FetchedMunicipalityListState) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.municipalityList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          
                          
                          context.read<MunicipalityBloc>().fetchMunicipality(state.municipalityList[index].muninicipalityId);
                        },
                        child: Container(
                          height: 60,
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.placemark,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                state.municipalityList[index].municipalityName,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return ShimmerUtils.buildIconRow(20);
                }
              },
            )
          ],
        ),
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
      ], child: this);
}
