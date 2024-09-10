import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/calendar_event_bloc/calendar_event_bloc_bloc.dart';
import 'package:municipium/bloc/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/repositories/calendar_event_repository.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class CalendarPage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CalendarCubit(),
          ),
          BlocProvider(
            create: (context) =>
                CalendarBloc(calendarEventRepository: CalendarEventRepository())
                  ..fetchCalendarEvents(DateTime.now()),
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
      ),
      body: Column(
        children: [
          BlocBuilder<CalendarBloc, CalendarEventBlocState>(
            builder: (context, state) {
              // Mappa degli eventi da visualizzare
              Map<DateTime, List<CalendarEvent>> events = {};

              List<Calendar> calendar = [];


              // Stato di caricamento
              if (state is TryCalendarState) {
                return const Center(child: CircularProgressIndicator());
              }

              // Stato con eventi caricati
              if (state is FetchedCalendarState) {
                events = _mapEventsToDate(state.calendar);
                calendar = state.calendar;
              }

              // In caso di errore
              if (state is ErrorCalendarState) {
                return const Center(child: Text('Error loading events.'));
              }

              // Calendario con eventi caricati o vuoto durante il caricamento
              return BlocBuilder<CalendarCubit, DateTime>(
                builder: (context, caledarCubitState) {
                  return Column(
                    children: [
                      Container(
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
                            context.read<CalendarCubit>().setDate(DateTime(selectedDay.year, selectedDay.month, selectedDay.day) );
                          },
                          calendarStyle: const CalendarStyle(
                            
                            markerDecoration: BoxDecoration(
                              color:  Color.fromARGB(255, 164, 181, 190), // Colore dell'indicatore
                              shape:
                                  BoxShape.circle, // Forma circolare per l'indicatore
                            ),
                            markersAlignment: Alignment.bottomCenter,
                          ),
                          eventLoader: (day) {
                            final loadedEvents = events.entries
                                .where((entry) => isSameDay(entry.key, day))
                                .map((entry) => entry.value)
                                .expand((eventList) => eventList)
                                .toList();
                        
                            print('Day: $day, Loaded events: $loadedEvents');
                            return loadedEvents;
                          },
                        ),
                      ),
                      events[caledarCubitState] != null ?
                      
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(calendar[0].date),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: events[caledarCubitState]!.length,
                              itemBuilder: (context, index) {
                                return Text(events[caledarCubitState]![index].title.toString());
                              },
                            ),
                          ],
                        ),
                      ) : Container()
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // Funzione per mappare gli eventi a una data specifica
  Map<DateTime, List<CalendarEvent>> _mapEventsToDate(
      List<Calendar> calendars) {
    final Map<DateTime, List<CalendarEvent>> events = {};

    for (var calendar in calendars) {
      // Converte la stringa della data in DateTime
      final DateTime date = DateTime.parse(calendar.date);

      // Aggiunge gli eventi alla mappa
      if (events.containsKey(date)) {
        events[date]!.addAll(calendar.events);
      } else {
        events[date] = calendar.events;
      }
    }

    return events;
  }
}
