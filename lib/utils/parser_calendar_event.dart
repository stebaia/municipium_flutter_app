import 'dart:collection';

import 'package:municipium/model/calendar_event/calendar_event.dart';

LinkedHashMap<DateTime, List<Calendar>> getCalendarParsedEvents(
    List<Calendar> calendarEvents) {
  final parsedEvents = LinkedHashMap<DateTime, List<Calendar>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  parsedEvents.addAll(getEventSource(calendarEvents));

  return parsedEvents;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

Map<DateTime, List<Calendar>> getEventSource(List<Calendar> calendarEvents) {
  return Map.fromIterable(calendarEvents,
      key: (event) => DateTime.parse(event.date),
      value: (event) => event.events);
}
