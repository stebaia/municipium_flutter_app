import 'package:dio/dio.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/requests/request_logout_spid.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';

part 'mmc_municipium_service.g.dart';

@RestApi()
abstract class MmcMunicipiumService {
  factory MmcMunicipiumService(Dio dio) = _MmcMunicipiumService;

  @GET(
      '{baseUrl}retriveUserData/{authId}?municipalityId={municipalityId}&authSystem={authSystem}&authIdOld={authIdOld}')
  Future<SpidUserModel> retriveUserData(
      @Path('baseUrl') String baseUrl,
      @Path('authId') authId,
      @Path('municipalityId') municipalityId,
      @Path('authSystem') authSystem,
      @Path('authIdOld') authIdOld);

  @POST('{baseUrl}disableDevice')
  Future<HttpResponse> logoutSpid(
      @Path('baseUrl') String baseUrl,
      //DISABLE DEVICE REQUEST
      @Body() RequestLogoutSpid requestLogoutSpid);
}
