class CalendarEvent {
  final String title;
  final int type;
  final String startDate;
  final String? endDate;

  CalendarEvent({required this.title, required this.type, required this.startDate, required this.endDate});

  // Metodo per creare un'istanza di CalendarEvent da un oggetto JSON
  factory CalendarEvent.fromJson(Map<String, dynamic> json) {
    return CalendarEvent(
      title: json['title'],
      type: json['type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
     
  }

  // Metodo per convertire un'istanza di CalendarEvent in un oggetto JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}