import 'package:logger/logger.dart';
import 'package:municipium/model/events/event_detail.dart';
import 'package:municipium/model/events/event_item_list.dart';
import 'package:municipium/services/network/api/event_service/event_service.dart';
import 'package:municipium/services/network/dto/event_detail_dto.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EventsRepository {
  final DTOMapper<EventDTO, EventItemList> eventItemMapper;
  final DTOMapper<EventDetailDto, EventDetail> eventDetailMapper;
  final EventService eventService;
  final Logger logger;

  EventsRepository(
      {required this.logger,
      required this.eventService,
      required this.eventItemMapper,
      required this.eventDetailMapper});

  Future<List<EventItemList>> getEventsList(
      {required int pageIndex, required int pageSize}) async {
    try {
      final EventPagedDTO eventsListResponse =
          await eventService.getEventsPaged(pageIndex, pageSize);
      final List<EventItemList> eventsList = [];
      if (eventsListResponse.results != null) {
        for (var element in eventsListResponse.results!) {
          eventsList.add(eventItemMapper.fromDTO(element));
        }
      }

      return eventsList;
    } catch (error, stackTrace) {
      logger.e('Error in getting events list');
      rethrow;
    }
  }

  Future<EventDetail> getEventDetail({required int id}) async {
    try {
      final EventDetailDto eventsListResponse =
          await eventService.getEventDetail(id);
      final EventDetail detail = eventDetailMapper.fromDTO(eventsListResponse);

      return detail;
    } catch (error, stackTrace) {
      logger.e('Error in getting events list');
      rethrow;
    }
  }
}
