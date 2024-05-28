import 'package:municipium/services/network/dto/event_detail_dto.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'event_service.g.dart';

@RestApi()
abstract class EventService {
  factory EventService(Dio dio, {String baseUrl}) = _EventService;

  @GET('events/{eventId}')
  Future<EventDetailDto> getEventDetail(@Path('eventId') int eventId);

  @GET('events/')
  Future<List<EventDTO>> getEventsList();

  @GET('events/paged_events?page_index={page_index}&page_size={page_size}')
  Future<EventPagedDTO> getEventsPaged(
      @Path('page_index') int page_index, @Path('page_size') int page_size);
}
