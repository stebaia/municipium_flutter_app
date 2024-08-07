import 'package:dio/dio.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/user/idp_model.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';

part 'auth_spid_service.g.dart';

@RestApi()
abstract class AuthSpidService {
  factory AuthSpidService(Dio dio, {String baseUrl}) =
      _AuthSpidService;

  @GET('get_idps')
  Future<List<IdpModel>>getIdps();
}

