import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ChooseMunicipalityPage extends StatelessWidget
    implements AutoRouteWrapper {
  ChooseMunicipalityPage({super.key});
  String? textToSearch;

  final ScrollController _scrollController = ScrollController();
  final List<Municipality> _municipalityList = [];
  final TextEditingController municipalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final municipality = (context.watch<MunicipalityGlobalCubit>().state
        as StoredMunicipalityGlobalState);
    final baseUrlNotifier =
        Provider.of<BaseUrlNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          
          title: Text(
            AppLocalizations.of(context)!
                .text_list_of_municipality_title
                .toUpperCase(),
            style: const TextStyle(fontSize: 20),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .backgroundColor,
              ),
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Icon(CupertinoIcons.text_bubble, color: Colors.orange,),
                  const SizedBox(height: 10,),
                  Text(AppLocalizations.of(context)!
                      .text_no_municipality_search),
                  
                  TextButton(
                    
                    onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Titolo del Popup"),
                              content: TextField(
                                  onChanged: (value) => textToSearch = value,
                                  decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context)!
                                        .text_search_municipality,
                                  )),
                              actions: [
                                TextButton(
                                  child: Text("Cerca"),
                                  onPressed: () async {
                                    if (textToSearch?.replaceAll(' ', '') ==
                                        'AbilitaStaging') {
                                      //await municipalityContext
                                      //.read<MunicipalityBloc>()
                                      //.deleteMunicipality();
                                      await baseUrlNotifier.updateBaseUrl(
                                          MunicipiumUtility.BASEURL_STAGING);
                                      context.pushRoute(ChooseMunicipalityRoute());
                                    } else if (textToSearch?.replaceAll(
                                            ' ', '') ==
                                        'AbilitaProduzione') {
                                      //await municipalityContext
                                      //.read<MunicipalityBloc>()
                                      //.deleteMunicipality();

                                      await baseUrlNotifier.updateBaseUrl(
                                          MunicipiumUtility.BASEURL_PROD);
                                      context.pushRoute(ChooseMunicipalityRoute());
                                    } else {}
                                    Navigator.of(context)
                                        .pop(); // Chiude il popup
                                  },
                                ),
                                TextButton(
                                  child: Text("Chiudi"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Chiude il popup
                                  },
                                ),
                              ],
                            );}),
                    child: Text(AppLocalizations.of(context)!.text_issue_now.toUpperCase(),
                    style:
                         const TextStyle(color: ThemeHelper.blueMunicipium, letterSpacing: 1),
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            
            
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .backgroundColor,
              ),
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Icon(CupertinoIcons.bell, color: Colors.orange,),
                  const SizedBox(height: 10,),
                  Text(AppLocalizations.of(context)!
                      .text_notify_from_other_municipality),
                  
                  TextButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.text_select_municipality.toUpperCase(),
                    style:
                         const TextStyle(color: ThemeHelper.blueMunicipium, letterSpacing: 1),
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),  
            TextField(
              
              controller: municipalityController,
                              onChanged: (value) {
                                if (value.length >= 3) {
                                  
                                  context
                                      .read<MunicipalityBloc>()
                                      .filterMunicipalityList(Provider.of<BaseUrlNotifier>(context,
                                      listen: false)
                                  .baseUrl,value);
                                } else if (value.isEmpty) {
                                  
                                }
                              },
              decoration: InputDecoration(
                fillColor: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .backgroundColor,
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
                  hintText:
                      AppLocalizations.of(context)!.text_search_municipality,
                  prefixIcon: const Icon(CupertinoIcons.search),
                  suffixIcon: const Icon(Icons.gps_fixed)),
            ),
            BlocConsumer<MunicipalityBloc, MunicipalityState>(
              listener: (context, state) async {
                if (state is FetchedMunicipalityState) {
                  await baseUrlNotifier.updateBaseUrl(
                                          'https://${state.municipality.subdomain}/api/v2');
                  context.pushRoute(WelcomeRoute(
                      municipalityId: state.municipality.muninicipalityId));
                }
                if(state is FetchedMunicipalityListState) {
                  _municipalityList.addAll(state.municipalityList);

                  context.read<MunicipalityBloc>().isFetching = false;
                }
                if(state is ErrorMunicipalityState) {
                  context.read<MunicipalityBloc>().isFetching = false;
                }

                if(state is FetchedFilteredMunicipalityListState) {
                  _municipalityList.clear();
                  _municipalityList.addAll(state.municipalityList);
                  context.read<MunicipalityBloc>().isFetching = false;
                }
              },
              builder: (context, state) {
                
                  return Expanded(
                    child: ListView.builder(
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.offset ==
                                  _scrollController.position.maxScrollExtent &&
                              !context.read<MunicipalityBloc>().isFetching) {
                            context.read<MunicipalityBloc>()
                              ..isFetching = true
                              ..add(FetchMunicipalityListEvent(Provider.of<BaseUrlNotifier>(context,
                                      listen: false)
                                  .baseUrl));
                          }
                        }),
                      shrinkWrap: true,
                      itemCount: _municipalityList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.read<MunicipalityBloc>().deleteMunicipality();
                          context.read<MunicipalityBloc>().fetchMunicipality(
                              Provider.of<BaseUrlNotifier>(context,
                                      listen: false)
                                  .baseUrl,
                              Provider.of<BaseUrlNotifier>(context,
                                      listen: false)
                                  .baseUrlBe,
                             _municipalityList[index].muninicipalityId);
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
                                _municipalityList[index].municipalityName,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                
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
          create: (context) => MunicipalityBloc(
              municipalityRepository: context.read())
            ..fetchMunicipalityList(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
        ),
        
      ], child: this);
}
