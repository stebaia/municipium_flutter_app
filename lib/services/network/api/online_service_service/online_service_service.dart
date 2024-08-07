import 'package:dio/dio.dart';
import 'package:municipium/model/online_service/online_service.dart';
import 'package:retrofit/retrofit.dart';

part 'online_service_service.g.dart';

@RestApi()
abstract class OnlineServiceService {
  factory OnlineServiceService(Dio dio, {String baseUrl}) = _OnlineServiceService;

  @GET('municipality_services')
  Future<List<OnlineService>> getServices();
}
