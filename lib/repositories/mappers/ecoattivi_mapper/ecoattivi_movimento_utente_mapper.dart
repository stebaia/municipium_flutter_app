import 'package:municipium/model/ecoattivi/ecoattivi_movimento_utente.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_movimento_utente.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviMovimentoUtenteMapper
    extends DTOMapper<EcoattiviMovimentoUtenteDto, EcoattiviMovimentoUtente> {
  @override
  EcoattiviMovimentoUtente fromDTO(EcoattiviMovimentoUtenteDto dto) {
    return EcoattiviMovimentoUtente(
      idUnivoco: dto.idUnivoco ?? '',
      origine: dto.origine ?? '',
      descTipoAzione: dto.descTipoAzione ?? '',
      punti: dto.punti ?? 0,
      dataOraUTC: dto.dataOraUTC ?? '',
    );
  }

  @override
  EcoattiviMovimentoUtenteDto toDTO(EcoattiviMovimentoUtente model) {
    return EcoattiviMovimentoUtenteDto(
      idUnivoco: model.idUnivoco,
      origine: model.origine,
      descTipoAzione: model.descTipoAzione,
      punti: model.punti,
      dataOraUTC: model.dataOraUTC,
    );
  }
}
