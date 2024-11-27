import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/bloc/civil_defence_bloc/emergency_call/emergency_call_bloc.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class CivilDefenceNumbersPage extends StatelessWidget
    implements AutoRouteWrapper {
  const CivilDefenceNumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!
              .civil_defence_phone_numbers
              .toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Container(
        child: BlocBuilder<EmergencyCallBloc, EmergencyCallState>(
          builder: (context, state) {
            if (state is NoEmergencyCallListState) {
              return const Center(child: Text('Nessun dato presente'));
            } else if (state is FetchingEmergencyCallListState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorEmergencyCallListState) {
              return const Center(
                  child: Text('Errore nel caricamento dei dati'));
            } else if (state is FetchedEmergencyCallListState) {
              return ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).canvasColor
                        ),
                    child: Center(
                        child: Text(
                            state.emergencyCallList[index].name.toUpperCase())),
                  ),
                  onTap: () => launchUrl(Uri.parse(
                      'tel:${state.emergencyCallList[index].number}')),
                ),
                itemCount: state.emergencyCallList.length,
                shrinkWrap: true,
                primary: false,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => EmergencyCallBloc(
              civilDefenceRepository: context.read())
            ..fetchEmergencyCallList(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
        ),
      ], child: this);
}
