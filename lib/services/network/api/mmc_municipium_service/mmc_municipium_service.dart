import 'package:dio/dio.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/services/network/dto/user_to_validate_dto.dart';
import 'package:municipium/services/network/dto/user_validated.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';

part 'mmc_municipium_service.g.dart';

@RestApi()
abstract class MmcMunicipiumService {
  factory MmcMunicipiumService(Dio dio) = _MmcMunicipiumService;

  @GET(
      '{baseUrl}/retriveUserData/{authId}?municipalityId={municipalityId}&authSystem={authSystem}')
  Future<SpidUserModel> retriveUserData(
    @Path('baseUrl') String baseUrl,
    @Path('authId') authId,
    @Path('municipalityId') municipalityId,
    @Path('authSystem') authSystem,
  );

  @POST('{baseUrl}/validateUser')
  Future<UserValidated> validateUser(
      @Path('baseUrl') String baseUrl, @Body() UserToValidateDto user);
}
