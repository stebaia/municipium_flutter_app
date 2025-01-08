import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/bloc/survey_bloc/survey_list_bloc/survey_bloc.dart';
import 'package:municipium/bloc/cubit/device_cubit/device_cubit.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/survey/survey.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SurveryListPage extends StatelessWidget implements AutoRouteWrapper {
  const SurveryListPage({super.key});

  Widget _buildSurveyList({
    required SurveyStatus status,
    required List<Survey> surveys,
    required bool isArchived,
  }) {
    switch (status) {
      case SurveyStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case SurveyStatus.loaded:
        return ListView.builder(

          primary: false,
          shrinkWrap: true,
          itemCount: surveys.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => context.pushRoute(SurveyDetailRoute(id: surveys[index].id)),
              leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: ThemeHelper.blueMunicipium,
                          borderRadius: BorderRadius.circular(50)),
                      child: isArchived
                  ?  const Icon(Icons.timelapse) : const Icon(Icons.poll)),
                   
              title: Text(surveys[index].title),
              subtitle: Text(
                  ' ${isArchived ? AppLocalizations.of(context)!.label_ended : AppLocalizations.of(context)!.label_end_date} ${MunicipiumUtility.getDateWithFormat(surveys[index].endDate, 'EEE d MMM', 'it')}',
                  style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.chevron_right),
            );
          },
        );
      case SurveyStatus.empty:
        return const Center(child: Text('Nessuna ricerca in lista'));
      case SurveyStatus.error:
        return const Center(child: Text('Errore nel caricamento'));
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.surveys_menu.toUpperCase(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<SurveyListBloc, SurveyListState>(
              builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.label_open_survey,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  _buildSurveyList(
                    isArchived: false,
                    status: state.activeSurveysStatus,
                    surveys: state.activeSurveys,
                  ),
                  Text(AppLocalizations.of(context)!.label_closed_survey,
                      style: Theme.of(context).textTheme.titleSmall),
                  _buildSurveyList(
                    isArchived: true,
                    status: state.archivedSurveysStatus,
                    surveys: state.archivedSurveys,
                  ),
                ],
              ),
            );
          }),
        ));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    String baseUrl =
        Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl;

    return FutureBuilder<DeviceBe?>(
      future: context.read<DeviceCubit>().getDeviceBeFromStorage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        String udid = snapshot.data?.udid ?? '';

        return BlocProvider(
          // Un solo BlocProvider poiché ora gestiamo tutto in un unico stato
          create: (context) => SurveyListBloc(surveyRepository: context.read())
            ..fetchSurveyList(
                baseUrl, 'false', udid) // Carica i sondaggi attivi
            ..fetchSurveyArchivedList(
                baseUrl, 'true', udid), // Carica i sondaggi archiviati
          child: this,
        );
      },
    );
  }
}
