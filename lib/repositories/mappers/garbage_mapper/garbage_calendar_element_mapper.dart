import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/model/garbage/garbage_calendar_element.dart';
import 'package:municipium/repositories/mappers/garbage_mapper/garbage_calendar_mapper.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/garbage_calendar_element_dto.dart';
import 'package:pine/pine.dart';

class GarbageCalendarElementMapper
    extends DTOMapper<CalendarElementDTO, GarbageCalendarElement> {
  @override
  GarbageCalendarElement fromDTO(CalendarElementDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    GarbageCalendarMapper garbageCalendarMapper = GarbageCalendarMapper();
    List<GarbageCalendars> garbageCalendar = [];
    if (dto.garbage != null) {
      for (var garbage in dto.garbage!) {
        garbageCalendar.add(garbageCalendarMapper.fromDTO(garbage));
      }
    }
    return GarbageCalendarElement(
        id: dto.id ?? 0,
        name: dto.name ?? '',
        description: dto.description ?? '',
        instructions: dto.instructions ?? '',
        imageWhite: mapperImages.fromDTO(dto.imageWhite!),
        imageGreen: mapperImages.fromDTO(dto.imageGreen!),
        imageGrey: mapperImages.fromDTO(dto.imageGrey!),
        garbageCalendars: garbageCalendar);
  }

  @override
  CalendarElementDTO toDTO(GarbageCalendarElement model) =>
      CalendarElementDTO();
}
