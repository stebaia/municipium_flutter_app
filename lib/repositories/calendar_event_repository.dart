import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/services/network/api/calendar_service/calendar_service.dart';

class CalendarEventRepository {
  CalendarEventRepository({
    required this.calendarService,
    required this.logger
  });

  final CalendarService calendarService;
  final Logger logger;


  Future<List<CalendarEvent>> getCalendarEvents({required String date, String? endDate, String? name, String? type}) async {
    try {
      final response = await calendarService.getCalendar(date, endDate, name, type);
      return response;
    }catch (e) {
      rethrow;
    }
  } 
}