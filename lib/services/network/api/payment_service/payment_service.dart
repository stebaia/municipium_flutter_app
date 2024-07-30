import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/self_payment_dto.dart';
import 'package:retrofit/http.dart';

part 'payment_service.g.dart';

@RestApi()
abstract class PaymentService {
  factory PaymentService(Dio dio) = _PaymentService;

  @GET(
      '{baseUrl}api/jsonws/jcitygov-pagamenti-spontanei-portlet.tipopagamento/get-by-ente-attivo-area?ente={ente}&areaIdStr={areaId}&codiceDebitoJppa={codice}')
  Future<List<SelfPaymentDTO>> getSelfPayments(
      @Path('baseUrl') String baseUrl,
      @Path('ente') String ente,
      @Path('areaId') String areaId,
      @Path('codice') String codice);
}
