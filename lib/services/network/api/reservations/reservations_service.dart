import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/reservable_unit_dto.dart';
import 'package:retrofit/http.dart';

part 'reservations_service.g.dart';

@RestApi()
abstract class ReservationsService {
  factory ReservationsService(Dio dio) = _ReservationsService;

  @GET('{baseUrl}/actions?id={municipalityId}&action=preno_unita')
  Future<List<ReservableUnitDto>> getReservationUnits(
      @Path('baseUrl') String baseUrl,
      @Path('municipalityId') int municipalityId);
}
