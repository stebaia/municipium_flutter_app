import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/bloc/garbage_blocs/garbage_calendar_detail_bloc/garbage_calendar_detail_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:municipium/model/garbage/garbage_detail_calendar.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Per formattare le date

@RoutePage()
class GarbageCalendarDetailPage extends StatelessWidget
    implements AutoRouteWrapper {
  const GarbageCalendarDetailPage(
      {super.key, required this.id, required this.start, required this.end, required this.title, required this.subtitle});
  final String id;
  final String start;
  final String end;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    Municipality municipality = context.read<MunicipalityStoredCubit>().state!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.calendar_menu.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(context: context, builder:(context) => AlertDialog(
                title: Text(title),
                content: Container(width: MediaQuery.of(context).size.width,height: 150,child: Html(data:subtitle,)),
                actions: [
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.label_text_close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
            },
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<GarbageDetailCalendarsBloc,
            GarbageDetailCalendarsState>(
          builder: (context, state) {
            if (state is FetchingGarbageDetailCalendarsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchedGarbageDetailCalendarsState) {
              final Map<String, List<GarbageDetailCalendar>> groupedItems = {};
              for (var item in state.garbageDetailCalendarsList) {
                final String date = DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(item.start!));
                if (!groupedItems.containsKey(date)) {
                  groupedItems[date] = [];
                }
                groupedItems[date]!.add(item);
              }

              // Ordina le date
              final List<String> sortedKeys = groupedItems.keys.toList()
                ..sort();

              return ListView.builder(
                itemCount: sortedKeys.length,
                itemBuilder: (context, index) {
                  final String date = sortedKeys[index];
                  final List<GarbageDetailCalendar> items = groupedItems[date]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header con la data
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          MunicipiumUtility.getDateWithFormat(
                              date,
                              'EEEE, dd MMMM',
                              Localizations.localeOf(context).languageCode),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      // Lista di categorie per la data
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, subIndex) {
                          final item = items[subIndex];
                          return Container(
                            child: ListTile(
                              onTap: () => context.pushRoute(GarbageElementDetailRoute(id: item.category!.id!)),
                              contentPadding: EdgeInsets.zero,
                              title: Text(item.category?.name ?? ''),
                              trailing:
                                  const Icon(CupertinoIcons.chevron_right),
                              leading: Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(4),
                                  child: Image.network(
                                    item.imageWhite != null
                                        ? 'http://${municipality.subdomain}${item.imageWhite!}'
                                        : '',
                                  )),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            } else if (state is NoGarbageDetailCalendarsState) {
              return const Center(child: Text("No data"));
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GarbageDetailCalendarsBloc(
                garbageCalendarsRepository: context.read())
              ..fetchGarbageDetailCalendars(
                  Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl,
                  id,
                  start,
                  end),
          ),
        ],
        child: this,
      );
}
