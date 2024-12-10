import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/garbage_calendar_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class GarbageCalendarMapper
    extends DTOMapper<GarbageCalendarsDTO, GarbageCalendars> {
  @override
  GarbageCalendars fromDTO(GarbageCalendarsDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    return GarbageCalendars(
       
        id: dto.id ?? 0,
        name: dto.name ?? '',
        updatedAt: dto.updatedAt ?? '',
        zone: dto.zone ?? ZoneDTO(),
        calendarTypeName: dto.calendarTypeName ?? '',
        calendarTypeIcon: dto.calendarTypeIcon != null
            ? mapperImages.fromDTO(dto.calendarTypeIcon!)
            : null,
        calendarTypeIconGrey: dto.calendarTypeIconGrey != null
            ? mapperImages.fromDTO(dto.calendarTypeIconGrey!)
            : null);
  }

  @override
  GarbageCalendarsDTO toDTO(GarbageCalendars model) => GarbageCalendarsDTO();
}
