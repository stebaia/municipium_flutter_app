import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/civil_defence_bloc/civil_defene_level/civil_defence_level_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:municipium/model/civil_defence/civil_defence_level.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class CivilDefenceLevelPage extends StatelessWidget
    implements AutoRouteWrapper {
  const CivilDefenceLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.civil_defence_alerts.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: BlocBuilder<CivilDefenceLevelsBloc, CivilDefenceLevelsState>(
        builder: (context, state) {
          if (state is FetchedCivilDefenceLevelsState) {
            CivilDefenceLevels civilDefenceLevel = state.civilDefenceLevels;
            return Column(
              children: [Text(civilDefenceLevel.livelloAllerta!.titolo!)],
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
      )
    ], child: this);
  }
}
