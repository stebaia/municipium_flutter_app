import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/bloc/civil_defence_bloc/are_you_ready_bloc/are_you_ready_bloc.dart';
import 'package:municipium/model/civil_defence/civil_defence_are_you_ready.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CivilDefenceAreYouReadyPage extends StatelessWidget
    implements AutoRouteWrapper {
  const CivilDefenceAreYouReadyPage({super.key});

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
      body: BlocBuilder<AreYouReadyBloc, AreYouReadyState>(
        builder: (context, state) {
          if (state is FetchedAreYouReadyStateState) {
            List<CivilDefenceAreYouReady> listOfCivilRisk =
                state.civilDefenceAreYouReady;
            return ListView.builder(
              itemCount: listOfCivilRisk.length,
              itemBuilder: (context, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${listOfCivilRisk[index].image!}.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(43, 0, 0, 0),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              listOfCivilRisk[index].title!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          } else if (state is FetchingAreYouReadyState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => AreYouReadyBloc(context.read())
            ..fetchAreYouReady(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
        )
      ], child: this);
}
