
import 'package:dio/dio.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/device/response_device_put.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'municipality_be_service.g.dart';

@RestApi()
abstract class MunicipalityBeService {
  factory MunicipalityBeService(Dio dio, {String baseUrl}) = _MunicipalityBeService;

  @PUT('devices')
  Future<ResponseDevicePut> putDevices(@Body() DeviceBe device);

  @PUT('devices')
  Future<HttpResponse> postDevices(@Body() DeviceBe device);
}
