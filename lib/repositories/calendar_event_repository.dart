import 'package:dio/dio.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';

class CalendarEventRepository {
  CalendarEventRepository();


  Future<List<Calendar>> getCalendarEvents(DateTime date) async {
    List<Calendar> response = [];
    response.add(Calendar(date: DateTime.parse('2024-09-09').toString(), events: [
       CalendarEvent(title: 'Raccolta indiffereziata', type: 1, startDate: '2021-01-01', endDate: '2021-01-01'),
      CalendarEvent(title: 'Fiera del libro', type: 2, startDate: '2021-01-02', endDate: '2021-01-02'),
      CalendarEvent(title: 'Fiera d\'estate', type: 2, startDate: '2021-01-02', endDate: '2021-01-02'),
    ]));
    response.add(Calendar(date: DateTime(date.year, date.month, date.day).toString(), events: [
      CalendarEvent(title: 'Raccolta indiffereziata', type: 1, startDate: '2021-01-01', endDate: '2021-01-01'),
      CalendarEvent(title: 'Fiera del libro', type: 2, startDate: '2021-01-02', endDate: '2021-01-02'),
      CalendarEvent(title: 'Fiera d\'estate', type: 2, startDate: '2021-01-02', endDate: '2021-01-02'),
    ]));
    
    return response;
    //final response = await calendarEventService.getCalendarEvents(date);
    //return response.map((e) => calendarEventMapper.fromDTO(e)).toList();
  } 
}