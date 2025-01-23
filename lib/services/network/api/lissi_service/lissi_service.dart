import 'package:dio/dio.dart';
import 'package:municipium/model/lissi/lissi_card_info.dart';
import 'package:municipium/model/lissi/lissi_presentation_template_info.dart';
import 'package:municipium/model/lissi/lissi_token_response.dart';
import 'package:municipium/model/lissi/presentation_session.dart';
import 'package:municipium/model/lissi/prestenation_lissi_template.dart';
import 'package:retrofit/retrofit.dart';

part 'lissi_service.g.dart';


@RestApi()
abstract class LissiService {
  factory LissiService(Dio dio,) = _LissiService;

  @POST('https://login-dev.maggioli.cloud/realms/lissi_connector/protocol/openid-connect/token')
  @FormUrlEncoded()
  Future<LissiTokenResponse> getToken({
    @Field("client_id") required String clientId,
    @Field("client_secret") required String clientSecret,
    @Field("grant_type") required String grantType,
    @Field("resource") required String resource,
  });

  @GET("https://maggioli.municipiumapp.it/api/v1/presentation-templates")
  Future<LissiPresentationTemplateResponse> getPresentationTemplates();

  @POST("https://maggioli.municipiumapp.it/api/v1/presentation-sessions")
  Future<HttpResponse<LissiPresentationSession>> postPresentationSession(
    @Body() LissiPresentationTemplateInfo presentationSessionInfo,
  );

  @GET("https://maggioli.municipiumapp.it/api/v1/presentation-sessions/{sessionId}")
  Future<HttpResponse<LissiCardInfo>> confirmPresentationSession(
  @Path('sessionId') String sessionId,
  );
}
