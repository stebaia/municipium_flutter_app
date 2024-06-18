import 'package:municipium/model/reservations/reservable_unit.dart';
import 'package:municipium/services/network/dto/reservable_unit_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class ReservableUnitMapper
    extends DTOMapper<ReservableUnitDto, ReservableUnit> {
  @override
  ReservableUnit fromDTO(ReservableUnitDto dto) {
    return ReservableUnit(titolo: dto.titolo, id: dto.id);
  }

  @override
  ReservableUnitDto toDTO(ReservableUnit model) {
    return ReservableUnitDto(titolo: model.titolo, id: model.id);
  }
}
