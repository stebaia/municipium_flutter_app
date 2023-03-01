import 'package:logger/logger.dart';
import 'package:municipium/model/event_item_list.dart';
import 'package:municipium/services/network/api/event_service/event_service.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:pine/utils/mapper.dart';

class EventsRepository {
  final DTOMapper<EventDTO, EventItemList> eventItemMapper;
  final EventService eventService;
  final Logger logger;

  EventsRepository(
      {required this.logger,
      required this.eventService,
      required this.eventItemMapper});

  Future<List<EventItemList>> getEventsList() async {
    try {
      final List<EventDTO> eventsListResponse =
          await eventService.getEventsList();
      final List<EventItemList> eventsList = [];
      eventsListResponse.forEach((element) {
        eventsList.add(eventItemMapper.fromDTO(element));
      });
      return eventsList;
    } catch (error, stackTrace) {
      logger.e('Error in getting news list', error, stackTrace);
      rethrow;
    }
  }
}
