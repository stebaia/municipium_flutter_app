import 'package:dio/dio.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';

part 'mmc_municipium_service.g.dart';

@RestApi()
abstract class MmcMunicipiumService {
  factory MmcMunicipiumService(Dio dio, {String baseUrl}) =
      _MmcMunicipiumService;

  @GET('retriveUserData/{authId}?municipalityId={municipalityId}&authSystem={authSystem}&authIdOld={authIdOld}')
  Future<SpidUserModel> retriveUserData(
      @Path('authId') authId, @Path('municipalityId') municipalityId, @Path('authSystem') authSystem, @Path('authIdOld') authIdOld);
}
