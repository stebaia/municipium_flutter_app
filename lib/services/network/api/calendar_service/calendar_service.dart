import 'package:dio/dio.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'calendar_service.g.dart';

@RestApi()
abstract class CalendarService {
  factory CalendarService(Dio dio) = _CalendarService;

  @GET('{baseUrl}/municipality_event')
  Future<List<CalendarEvent>> getCalendar(
      @Path('baseUrl') String baseUrl,
      @Query('date') String date,
      @Query('date_end') String? endDate,
      @Query('name') String? name,
      @Query('type', encoded: true) String? type);
}
