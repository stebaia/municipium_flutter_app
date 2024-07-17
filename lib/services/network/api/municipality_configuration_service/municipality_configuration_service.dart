import 'package:dio/dio.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';

part 'municipality_configuration_service.g.dart';

@RestApi()
abstract class MunicipalityConfigurationService {
  factory MunicipalityConfigurationService(Dio dio) =
      _MunicipalityConfigurationService;

  @GET('{baseUrl}digital_dossier/configurations')
  Future<Configurations> getMunicipalityConfigurations(
      @Path('baseUrl') baseUrl);
}
