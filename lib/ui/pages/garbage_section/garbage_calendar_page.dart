import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/garbage_blocs/garbage_calendar_bloc/garbge_calendar_bloc.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:provider/provider.dart';

@RoutePage()
class GarbageCalendarPage extends StatefulWidget implements AutoRouteWrapper {
  const GarbageCalendarPage({super.key});

  @override
  State<GarbageCalendarPage> createState() => _GarbageCalendarPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GarbageCalendarsBloc(
                garbageCalendarsRepository: context.read())
              ..fetchGarbageCalendars(
                  Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
          ),
        ],
        child: this,
      );
}

class _GarbageCalendarPageState extends State<GarbageCalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!
              .text_garbage_calendar_title
              .toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            BlocBuilder<GarbageCalendarsBloc, GarbageCalendarsState>(
              builder: (context, state) {
                if (state is FetchedGarbageCalendarsState) {
                  List<GarbageCalendars> garbageCalendars =
                      state.garbageCalendarsList;
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: garbageCalendars.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () => context.pushRoute(
                                  GarbageCalendarDetailRoute(
                                      id: garbageCalendars[index].id.toString(),
                                      start:
                                          MunicipiumUtility
                                              .getStartGarbageCalendarOfMonth(),
                                      end: MunicipiumUtility
                                          .getEndGarbageCalendarOfMonth(),
                                      title: garbageCalendars[index].zone.name!,
                                      subtitle: garbageCalendars[index]
                                          .zone
                                          .description!)),
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    garbageCalendars[index]
                                                .calendarTypeIcon!
                                                .baseUrl !=
                                            null
                                        ? Container(
                                            padding: const EdgeInsets.all(6),
                                            width: 50,
                                            height: 50,
                                            child: Image.network(
                                              garbageCalendars[index]
                                                      .calendarTypeIconGrey!
                                                      .baseUrl! +
                                                  garbageCalendars[index]
                                                      .calendarTypeIcon!
                                                      .i640!,
                                            ))
                                        : Container(
                                            width: 50,
                                          ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            garbageCalendars[index]
                                                .calendarTypeName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(garbageCalendars[index].name),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  );
                } else if (state is FetchingGarbageCalendarsState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text("Error"));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
