import 'package:municipium/model/garbage/garbage_detail_calendar.dart';
import 'package:municipium/services/network/dto/garbage_calendar_dto.dart';
import 'package:municipium/services/network/dto/event_detail_dto.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:municipium/services/network/dto/garbage_calendar_element_dto.dart';
import 'package:municipium/utils/municipium_api.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'garbage_service.g.dart';

@RestApi()
abstract class GarbageService {
  factory GarbageService(Dio dio) = _GarbageService;

  @GET('{baseUrl}/${MunicipiumApi.GARBAGE_CATEGORIES}')
  Future<EventDetailDto> getGarbageCategoriesURL(
      @Path('baseUrl') String baseUrl);
  
  @GET('{baseUrl}/${MunicipiumApi.GARBAGE_CATEGORIES}/{id}')
  Future<CalendarElementDTO> getGarbageSubCategoriesURL(
      @Path('baseUrl') String baseUrl,
      @Path('id') String id
      );

  @GET('{baseUrl}/${MunicipiumApi.GARBAGE_CATEGORIES}')
  Future<List<EventDTO>> getGarbageCollectionsURL(@Path('baseUrl') String baseUrl);

  @GET('{baseUrl}/${MunicipiumApi.CALENDARS}')
  Future<List<GarbageCalendarsDTO>> getGarbageCalendars(@Path('baseUrl') String baseUrl);

  @GET('{baseUrl}/${MunicipiumApi.CALENDARS_GET}{id}?start={start}&end={end}')
  Future<List<GarbageDetailCalendar>> getGarbage(@Path('baseUrl') String baseUrl, @Path('id') String id, @Path('start') String start, @Path('end') String end);
}