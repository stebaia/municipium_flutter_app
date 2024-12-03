import 'package:logger/logger.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/api/garbage_service/garbage_service.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';

class GarbageRepository {
  final GarbageService service;
  final Logger logger;
  final MunicipiumImageMapper mapperImages;

  GarbageRepository(
      {
        required this.mapperImages,
      required this.service,
      required this.logger});

  Future<List<GarbageCalendars>> getGarbageCalendarsList(
      String baseUrl,) async {
    try {
      final garbageCalendarsResponse =
          await service.getGarbageCalendars(baseUrl);
      final List<GarbageCalendars> garbageCalendarsList = [];
      for (var element in garbageCalendarsResponse) {
        garbageCalendarsList.add(GarbageCalendars(id: element.id, name: element.name, calendarTypeName: element.calendarTypeName, calendarTypeIcon: mapperImages.fromDTO(element.calendarTypeIconDTO ?? MImagesDTO()), calendarTypeIconGrey: mapperImages.fromDTO(element.calendarTypeIconGreyDTO ?? MImagesDTO())));
        //garbageCalendarsList.add(element);
      }
      return garbageCalendarsList;
    } catch (error) {
      logger.e('Error in getting reservations units list');
      rethrow;
    }
  }
}