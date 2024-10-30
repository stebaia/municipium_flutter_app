import 'package:dio/dio.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'calendar_service.g.dart';

@RestApi()
abstract class CalendarService {
  factory CalendarService(Dio dio, {String baseUrl}) = _CalendarService;

  @GET('municipality_event')
  Future<List<CalendarEvent>> getCalendar(
    @Query('date') String date,
    @Query('date_end') String? endDate,
    @Query('name') String? name,
    @Query('type', encoded: true) String? type
  );
}
