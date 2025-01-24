import 'package:municipium/model/ecoattivi/ecoattivi_ranking_comune.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_ranking_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviRankingComuneMapper
    extends DTOMapper<EcoattiviRankingComuneDto, EcoattiviRankingComune> {
  @override
  EcoattiviRankingComune fromDTO(EcoattiviRankingComuneDto dto) {
    return EcoattiviRankingComune(
      ranking: dto.ranking ?? 0,
      nomeComune: dto.nomeComune ?? '',
      comuneUtente: dto.comuneUtente ?? false,
    );
  }

  @override
  EcoattiviRankingComuneDto toDTO(EcoattiviRankingComune model) {
    return EcoattiviRankingComuneDto(
      ranking: model.ranking,
      nomeComune: model.nomeComune,
      comuneUtente: model.comuneUtente,
    );
  }
}
