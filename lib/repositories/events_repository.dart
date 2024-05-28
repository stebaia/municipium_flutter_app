import 'package:logger/logger.dart';
import 'package:municipium/model/event_item_list.dart';
import 'package:municipium/services/network/api/event_service/event_service.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EventsRepository {
  final DTOMapper<EventDTO, EventItemList> eventItemMapper;
  final EventService eventService;
  final Logger logger;

  EventsRepository(
      {required this.logger,
      required this.eventService,
      required this.eventItemMapper});

  Future<List<EventItemList>> getEventsList({required int pageIndex, required int pageSize}) async {
    try {
      final EventPagedDTO eventsListResponse =
          await eventService.getEventsPaged(pageIndex, pageSize);
      final List<EventItemList> eventsList = [];
      if(eventsListResponse.results != null) {
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
}
