import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'event_service.g.dart';

@RestApi()
abstract class EventService {
  factory EventService(Dio dio, {String baseUrl}) = _EventService;

  @GET('news/{eventId}')
  Future<EventDTO> getEventDetail(@Path('eventId') int eventId);

  @GET('news/')
  Future<List<EventDTO>> getEventsList();
}
