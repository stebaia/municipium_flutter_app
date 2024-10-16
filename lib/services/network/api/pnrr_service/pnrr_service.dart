import 'package:dio/dio.dart';
import 'package:municipium/model/pnrr/service_pnrr.dart';
import 'package:municipium/services/network/dto/pnrr_body_dto.dart';
import 'package:municipium/services/network/dto/service_pnrr_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'pnrr_service.g.dart';

@RestApi()
abstract class PnrrService {
  factory PnrrService(Dio dio, {String baseUrl}) = _PnrrService;

  @GET('paged_pnrr?type={type}&orderByName=1')
  Future<ServicePnrrDTOResponse> getServices(@Path('type') String type);

  @GET('pnrr/{type}/{id}')
  Future<PnrrBodyResponseDto> getPnrrDetail(
      @Path('type') String type, @Path('id') int id);
}
