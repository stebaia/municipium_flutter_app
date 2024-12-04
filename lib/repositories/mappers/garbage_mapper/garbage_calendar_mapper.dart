import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/garbage_calendar_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class GarbageCalendarMapper extends DTOMapper<GarbageCalendarsDTO, GarbageCalendars> {
  @override
  GarbageCalendars fromDTO(GarbageCalendarsDTO dto) {
     MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
     return GarbageCalendars(id: dto.id!, name: dto.name!, updatedAt: dto.updatedAt!, zone: dto.zone!, calendarTypeName: dto.calendarTypeName!, calendarTypeIcon: mapperImages.fromDTO(dto.calendarTypeIcon!), calendarTypeIconGrey: mapperImages.fromDTO(dto.calendarTypeIconGrey!));
  }
  @override
  GarbageCalendarsDTO toDTO(GarbageCalendars model) =>
      GarbageCalendarsDTO();
}
