import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/calendar_event_bloc/calendar_event_bloc_bloc.dart';
import 'package:municipium/bloc/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/repositories/calendar_event_repository.dart';
import 'package:municipium/ui/components/bottom_sheet/bottom_sheet_calendar_filter.dart';
import 'package:municipium/ui/components/bottom_sheet/bottom_sheet_calendar_search.dart';
import 'package:municipium/utils/calendar_utility.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class CalendarPage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CalendarCubit(),
          ),
        ],
        child: this,
      );

  const CalendarPage({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;

    // 1. Ottenere l'altezza totale dello schermo
    final double screenHeight = MediaQuery.of(context).size.height;

    // 2. Determinare l'altezza dell'AppBar
    final double appBarHeight = kToolbarHeight;

    // 3. Impostare un'altezza fissa per il TableCalendar
    final double calendarHeight = 360.0; // Puoi regolare questa altezza

    // 4. Calcolare l'altezza rimanente

    return BlocBuilder<CalendarBloc, CalendarEventBlocState>(
      builder: (context, state) {
         Map<DateTime, List<CalendarEvent>> events = {};

                  List<CalendarEvent> calendar = [];

                  // Stato di caricamento

                  // Stato con eventi caricati
                  if (state is FetchedCalendarState) {
                    calendar = state.calendar;
                    events = _mapEventsToDate(state.calendar);
                    calendar = state.calendar;
                  }
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.text_calendar_title.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            leading: GestureDetector(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      builder: (context) => BottomSheetFilter(
                          filterIdList: CalendarUtility.filterList),
                    );
                  },
                  icon: const Icon(CupertinoIcons.slider_horizontal_3)),
              IconButton(
                  onPressed: () {
                    showBottomSheet(
                        context: context,
                        builder: (context) =>
                            BottomSheetSearchCalendar(calendarEvents: calendar));
                  },
                  icon: const Icon(CupertinoIcons.search))
            ],
          ),
          body: Column(
            children: [
               BlocBuilder<CalendarCubit, DateTime>(
                    builder: (context, caledarCubitState) {
                      return Column(
                        children: [
                          Container(
                            height: calendarHeight,
                            color: Theme.of(context).canvasColor,
                            child: TableCalendar<CalendarEvent>(
                              headerStyle: const HeaderStyle(
                                titleCentered: true,
                              ),
                              availableCalendarFormats: const {
                                CalendarFormat.month: 'Month'
                              },
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: caledarCubitState,
                              selectedDayPredicate: (day) {
                                // Determina se il giorno è selezionato
                                return isSameDay(caledarCubitState, day);
                              },
                              onDaySelected: (selectedDay, focusedDay) {
                                // Quando viene selezionato un nuovo giorno, aggiorna lo stato nel Cubit
                                context.read<CalendarCubit>().setDate(DateTime(
                                    selectedDay.year,
                                    selectedDay.month,
                                    selectedDay.day));
                              },
                              calendarStyle: const CalendarStyle(
                                markerDecoration: BoxDecoration(
                                  color: Color.fromARGB(255, 164, 181,
                                      190), // Colore dell'indicatore
                                  shape: BoxShape
                                      .circle, // Forma circolare per l'indicatore
                                ),
                                markersAlignment: Alignment.bottomCenter,
                              ),
                              eventLoader: (day) {
                                final loadedEvents = events.entries
                                    .where((entry) => isSameDay(entry.key, day))
                                    .map((entry) => entry.value)
                                    .expand((eventList) => eventList)
                                    .toList();

                                //print('Day: $day, Loaded events: $loadedEvents');
                                return loadedEvents;
                              },
                            ),
                          ),
                          events[caledarCubitState] != null
                              ? Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(
                                            // Controlla se la data corrisponde a oggi, ieri o domani
                                            MunicipiumUtility
                                                .getFormatDayFromDate(
                                                    events[caledarCubitState]!
                                                        .first
                                                        .startDate)),
                                      ),
                                      Container(
                                        height: 240,
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          separatorBuilder: (context, index) =>
                                              Divider(),
                                          itemCount:
                                              events[caledarCubitState]!.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(
                                                events[caledarCubitState]![
                                                        index]
                                                    .title
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                              leading: Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 10),
                                                width: 16,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  color: CalendarUtility
                                                      .getColorFromType(
                                                    events[caledarCubitState]![
                                                            index]
                                                        .type,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    },
                  )
              
            ],
          ),
        );
      },
    );
  }

  // Funzione per mappare gli eventi a una data specifica
  Map<DateTime, List<CalendarEvent>> _mapEventsToDate(
      List<CalendarEvent> calendars) {
    final Map<DateTime, List<CalendarEvent>> events = {};

    for (var calendar in calendars) {
      // Converte la stringa della data in DateTime
      final DateTime date = DateTime.parse(calendar.startDate);

      // Aggiunge gli eventi alla mappa
      if (!events.containsKey(date)) {
        events[date] = []; // Inizializza la lista se la chiave non esiste
      }
      events[date]!.add(calendar); // Aggiunge l'evento alla lista
    }

    return events;
  }
}
