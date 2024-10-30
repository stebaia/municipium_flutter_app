import 'package:dio/dio.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/device/response_device_put.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'municipality_be_service.g.dart';

@RestApi()
abstract class MunicipalityBeService {
  factory MunicipalityBeService(Dio dio) = _MunicipalityBeService;

  @PUT('{baseUrl}/devices')
  Future<ResponseDevicePut> putDevices(
      @Path('baseUrl') String baseUrl, @Body() DeviceBe device);

  @PUT('{baseUrl}/devices')
  Future<HttpResponse> postDevices(
      @Path('baseUrl') String baseUrl, @Body() DeviceBe device);
}
