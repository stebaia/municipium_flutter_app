import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/services/network/dto/user_to_validate_dto.dart';

class UserToValidateMapper {
  static UserToValidateDto convert(SpidUserModel user, int istat, String token,
      String service, String? codiceAmico, bool privacy) {
    return UserToValidateDto(
        service: service,
        tel: user.cellulare,
        codiceAmico: codiceAmico,
        istat: istat,
        codiceFiscale: user.codiceFiscale,
        token: token,
        flagPrivacy: privacy ? 1 : 0,
        email: user.mailAddress,
        cognome: user.cognome,
        nome: user.nome);
  }
}
