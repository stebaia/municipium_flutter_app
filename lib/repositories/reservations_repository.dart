import 'package:logger/logger.dart';
import 'package:municipium/model/reservations/reservable_unit.dart';
import 'package:municipium/repositories/mappers/reservations_mapper/reservable_unit_mapper.dart';
import 'package:municipium/services/network/api/reservations/reservations_service.dart';
import 'package:municipium/services/network/dto/reservable_unit_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class ReservationsRepository {
  final DTOMapper<ReservableUnitDto, ReservableUnit> resarvableUnitsMapper;
  final ReservationsService service;
  final Logger logger;

  ReservationsRepository(
      {required this.resarvableUnitsMapper,
      required this.service,
      required this.logger});

  Future<List<ReservableUnit>> getReservationUnitsList(
      int municipalityId) async {
    try {
      final reservationsResponse =
          await service.getReservationUnits(municipalityId);
      final List<ReservableUnit> reservationsUnitsList = [];
      for (var element in reservationsResponse) {
        reservationsUnitsList.add(resarvableUnitsMapper.fromDTO(element));
      }
      return reservationsUnitsList;
    } catch (error) {
      logger.e('Error in getting reservations units list');
      rethrow;
    }
  }
}
