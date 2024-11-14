import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/calendar_filter_cubit/calendar_filter_cubit.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/utils/calendar_utility.dart';
import 'package:municipium/utils/municipium_utility.dart';

class BottomSheetSearchCalendar extends StatefulWidget {
  const BottomSheetSearchCalendar({super.key, required this.calendarEvents});

  final List<CalendarEvent> calendarEvents;

  @override
  State<BottomSheetSearchCalendar> createState() =>
      _BottomSheetSearchCalendarState();
}

class _BottomSheetSearchCalendarState extends State<BottomSheetSearchCalendar> {
  late List<CalendarEvent> filteredEvents;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    filteredEvents = widget.calendarEvents; // Inizializza con tutti gli eventi
    _searchController.addListener(_filterEvents); // Aggiungi listener
  }

  void _filterEvents() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredEvents = widget.calendarEvents.where((event) {
        return event.title.toLowerCase().contains(query); // Filtra per titolo
      }).toList();
    }); 
        filteredEvents.sort((a, b) => DateTime.parse(a.startDate).compareTo(DateTime.parse(b.startDate)));

  }

  @override
  void dispose() {
    _searchController.dispose(); // Pulisci il controller
    super.dispose();
  }

  List<GroupedEvents> groupEventsByDate(List<CalendarEvent> events) {
    final Map<DateTime, List<CalendarEvent>> groupedMap = {};

    for (var event in events) {
      final date = DateTime.parse(event
          .startDate); // Assicurati che startDate sia una stringa in formato ISO 8601
      if (!groupedMap.containsKey(date)) {
        groupedMap[date] = [];
      }
      groupedMap[date]!.add(event);
    }

    return groupedMap.entries.map((entry) {
      return GroupedEvents(date: entry.key, events: entry.value);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final groupedEvents = groupEventsByDate(filteredEvents); // Raggruppa gli eventi filtrati

    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
              ),
              Text(
                'Cerca',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(255, 231, 225, 225))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(255, 231, 225, 225))),
                hintText: "Cosa stai cercando?",
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: groupedEvents.length,
                itemBuilder: (context, groupIndex) {
                  final group = groupedEvents[groupIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MunicipiumUtility.getFormatDayFromDate(group.date.toString()),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: group.events.length,
                        itemBuilder: (context, eventIndex) {
                          final event = group.events[eventIndex];
                          return ListTile(
                            title: Text(
                              event.title,
                              style: const TextStyle(fontSize: 14),
                            ),
                            leading: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: CalendarUtility.getColorFromType(event.type),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTile(BuildContext context, FilterType filterType,
      String label, Color color, Set<FilterType> activeFilters) {
    return CheckboxListTile(
      value: activeFilters.contains(filterType),
      onChanged: (isChecked) {
        context.read<FilterCubit>().toggleFilter(filterType);
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(label),
      activeColor: color,
      checkColor: Colors.white,
    );
  }

  // Funzione per raggruppare gli eventi per giorno
}
