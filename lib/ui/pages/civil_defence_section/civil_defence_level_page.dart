import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:municipium/bloc/bloc/civil_defence_bloc/civil_defene_level/civil_defence_level_bloc.dart';
import 'package:municipium/bloc/cubit/boolean_cubit/boolean_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:municipium/model/civil_defence/civil_defence_level.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/extension.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class CivilDefenceLevelPage extends StatelessWidget
    implements AutoRouteWrapper {
  const CivilDefenceLevelPage({super.key});

  Widget buildListRiks(BuildContext context, LevelDay todayRisk, Rischi risk) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        _buildRiskLevel(todayRisk.codiceLivello!),
                        const SizedBox(
                          width: 10,
                        ),
                        todayRisk.nomeRischio != null
                            ? Flexible(
                                child: Text(todayRisk.nomeRischio!,
                                    style:
                                        Theme.of(context).textTheme.titleMedium),
                              )
                            : Flexible(
                                child: Text(risk.nomeRischio!,
                                    style:
                                        Theme.of(context).textTheme.titleMedium),
                              ),
                      ],
                    ),
                  ),
                  todayRisk.codiceRischio != null
                      ? _builRiskIcon(
                          todayRisk.codiceRischio!, todayRisk.colore ?? '#000000')
                      : Container(),
                ],
              ),
              const Divider(
                height: 30,
              ),
              Text(todayRisk.denominazioneLivello ?? '',
                  style: Theme.of(context).textTheme.titleSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Criticià ${todayRisk.criticita ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      MunicipiumUtility.convertDate(
                        todayRisk.dataPrevisione!,
                        'dd-MM-yyyy',
                      ),
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 14,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: HexColor.fromHex(todayRisk.colore ?? '#000000')),
        ),
      ],
    );
  }

  Widget _buildRiskLevel(int codiceLivello) {
    switch (codiceLivello) {
      case -1:
        return Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            child: const Icon(
              FontAwesomeIcons.ban,
              color: Colors.white,
            ));
      case 0:
        return Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.green),
            child: Icon(
              FontAwesomeIcons.check,
              color: Colors.white,
            ));
      case 3:
        return Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orangeAccent),
            child: Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.white,
            ));
      case 4:
        return Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.orange),
            child: Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.white,
            ));
      case 5:
        return Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
            child: Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.white,
            ));
      default:
        return const Icon(
          Icons.warning,
          color: Colors.green,
        );
    }
  }

  Widget _builRiskIcon(int codiceRischio, String color) {
    switch (codiceRischio) {
      case 0:
      case 1:
      case 2:
        return Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor.fromHex(color)),
            child: Image.asset('assets/images/ic_neve.PNG'));
      case 3:
        return Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor.fromHex(color)),
            child: Image.asset('assets/images/ic_incendi_alberi.PNG'));
      case 7:
        return Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor.fromHex(color)),
            child: Image.asset('assets/images/ic_pioggia.PNG'));
      case 8:
        return Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor.fromHex(color)),
            child: Image.asset('assets/images/ic_vento.PNG'));
      case 9:
        return Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor.fromHex(color)),
            child: Image.asset('assets/images/ic_valanghe.PNG'));
      case 10:
        return Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor.fromHex(color)),
            child: Image.asset('assets/images/ic_pioggia.PNG'));
      default:
        return Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor.fromHex(color)),
            child: Image.asset('assets/images/ic_pioggia.PNG'));
    }
  }

  Future<void> dialogBuilder(BuildContext context, String type) {
    return showDialog(context: context, builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
  insetPadding: EdgeInsets.all(10),
  child: Stack(
    clipBehavior: Clip.none, alignment: Alignment.center,
    children: <Widget>[
      Container(
        width: double.infinity,
        height: type == 'e015' ? 500 : 420,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).canvasColor
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.text_title_dialog_legend_risk, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
            const SizedBox(
              height: 20,
            ),
            buildLegendRow(context, 'D9D9D9', AppLocalizations.of(context)!.text_legend_white, AppLocalizations.of(context)!.text_legend_no_prediction),
            const SizedBox(
              height: 14,
            ),
            buildLegendRow(context, '66CC00', AppLocalizations.of(context)!.text_legend_green, AppLocalizations.of(context)!.text_legend_no_risk),
            const SizedBox(
              height: 14,
            ),
            buildLegendRow(context, 'FFDD00', AppLocalizations.of(context)!.text_legend_yellow, AppLocalizations.of(context)!.text_legend_ordinary_risk),
            const SizedBox(
              height: 14,
            ),
            buildLegendRow(context, 'FF9900', AppLocalizations.of(context)!.text_legend_orange, AppLocalizations.of(context)!.text_legend_yellow_risk),
            const SizedBox(
              height: 14,
            ),
            buildLegendRow(context, 'FF0000', AppLocalizations.of(context)!.text_legend_red, AppLocalizations.of(context)!.text_legend_red_risk),
            const SizedBox(
              height: 20,
            ),
            type.toLowerCase() == 'e015' ? new InkWell(
              child:  const Text('Protezione Civile Regione Lombardia - Documenti di allertamento', style: TextStyle(color: Colors.blue,fontSize: 15, fontWeight: FontWeight.w700)),
              onTap: () => launchUrl(Uri.parse('https://www.allertalom.regione.lombardia.it/allerta'))
          ) : Container(),
          ],

          
      ),
      )
      
    ],
  )
    ));
  }


  Widget buildLegendRow(BuildContext context, String color, String title, String desc) {
    return Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: HexColor.fromHex(color),
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(title, style: Theme.of(context).textTheme.bodyLarge,),
                    const SizedBox(
                      height: 6,
                    ),  
                    Text(desc, style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                )
              ],
            );
  }


  @override
  Widget build(BuildContext context) {
    String type = context.read<MunicipalityStoredCubit>().state!.civilDefenceType;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.civil_defence_alerts.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        actions: [
          IconButton(onPressed: () {
            dialogBuilder(context, type);
          }, icon: const Icon(Icons.info_outline))
        ],
      ),
      body: BlocBuilder<CivilDefenceLevelsBloc, CivilDefenceLevelsState>(
        builder: (context, state) {
          if (state is FetchedCivilDefenceLevelsState) {
            List<LevelDay> todayRisk = [];
            List<LevelDay> tomorrowRisk = [];
            for (Rischi rischi in state.civilDefenceLevels.rischi!) {
              todayRisk.add(rischi.oggi![0]);
              tomorrowRisk.add(rischi.domani![0]);
            }

            CivilDefenceLevels civilDefenceLevel = state.civilDefenceLevels;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        civilDefenceLevel.livelloAllerta?.titolo != null
                            ? Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).canvasColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.warning),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                            child: Text(civilDefenceLevel
                                                .livelloAllerta!.titolo!)),
                                      ],
                                    ),
                                    const Divider(
                                      height: 40,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(CupertinoIcons.clock),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text(
                                              'Dati aggiornati al: ${civilDefenceLevel.livelloAllerta!.dataEmissione!}'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                            : Container(),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<BooleanCubit, bool>(
                          builder: (context, isToday) {
                            return ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: todayRisk.length,
                                itemBuilder: (context, index) => isToday
                                    ? buildListRiks(
                                        context,
                                        tomorrowRisk[index],
                                        state.civilDefenceLevels.rischi![index])
                                    : buildListRiks(
                                        context,
                                        todayRisk[index],
                                        state.civilDefenceLevels
                                            .rischi![index]));
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<BooleanCubit, bool>(
                          builder: (context, state) {
                            return Container(
                              height: 60,
                              margin: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () => context
                                            .read<BooleanCubit>()
                                            .setValue(false),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20)),
                                            color: state
                                                ? Theme.of(context).canvasColor
                                                : Theme.of(context).cardColor,
                                          ),
                                          child: const Center(
                                            child: Text('Oggi'),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () => context
                                            .read<BooleanCubit>()
                                            .setValue(true),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            color: !state
                                                ? Theme.of(context).canvasColor
                                                : Theme.of(context).cardColor,
                                          ),
                                          child: Center(
                                            child: Text('Domani'),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ))
              ],
            );
          } else if (state is FetchingCivilDefenceLevelsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)!.error_news_fetched),
            );
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    String baseUrl =
        Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl;

    String type =
        context.read<MunicipalityStoredCubit>().state!.civilDefenceType;
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            CivilDefenceLevelsBloc(civilDefenceRepository: context.read())
              ..fetchCivilDefenceLevels(baseUrl, type),
      ),
      BlocProvider(create: (context) => BooleanCubit(false))
    ], child: this);
  }
}
