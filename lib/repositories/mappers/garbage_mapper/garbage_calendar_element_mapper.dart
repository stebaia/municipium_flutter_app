import 'package:municipium/model/garbage/garbage_calendar_element.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/garbage_calendar_element_dto.dart';
import 'package:pine/pine.dart';

class GarbageCalendarElementMapper extends DTOMapper<CalendarElementDTO, GarbageCalendarElement> {
  @override
  GarbageCalendarElement fromDTO(CalendarElementDTO dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    return GarbageCalendarElement(
        id: dto.id ?? 0,
        name: dto.name ?? '',
        description: dto.description ?? '',
        instructions: dto.instructions ?? '',
        imageWhite: mapperImages.fromDTO(dto.imageWhite!),
        imageGreen: mapperImages.fromDTO(dto.imageGreen!),        
        imageGrey: mapperImages.fromDTO(dto.imageGrey!));
  }

  @override
  CalendarElementDTO toDTO(GarbageCalendarElement model) => CalendarElementDTO();
  
  
}