class Calendar {
  final String date;
  final List<CalendarEvent> events;

  Calendar({required this.date, required this.events});
}

class CalendarEvent {
  final String title;
  final int type;
  final String startDate;
  final String endDate;

  CalendarEvent({required this.title, required this.type, required this.startDate, required this.endDate});
}