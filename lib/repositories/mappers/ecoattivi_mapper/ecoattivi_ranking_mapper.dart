import 'package:municipium/model/ecoattivi/ecoattivi_ranking.dart';
import 'package:municipium/repositories/mappers/ecoattivi_mapper/ecoattivi_ranking_comune_mapper.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_ranking_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviRankingMapper
    extends DTOMapper<EcoattiviRankingDto, EcoattiviRanking> {
  @override
  EcoattiviRanking fromDTO(EcoattiviRankingDto dto) {
    return EcoattiviRanking(
      resultCode: dto.resultCode ?? 0,
      errorMessage: dto.errorMessage ?? '',
      classificaNazionale: dto.classificaNazionale ?? 0,
      numIscrittiTotali: dto.numIscrittiTotali ?? 0,
      puntiProssimoNazionale: dto.puntiProssimoNazionale ?? 0,
      posizioneProssimoNazionale: dto.posizioneProssimoNazionale ?? 0,
      classificaLocale: dto.classificaLocale ?? 0,
      numIscrittiComune: dto.numIscrittiComune ?? 0,
      puntiProssimoLocale: dto.puntiProssimoLocale ?? 0,
      posizioneProssimoLocale: dto.posizioneProssimoLocale ?? 0,
      numComuni: dto.numComuni ?? 0,
      comuni: dto.comuni
              ?.map((comuneDto) =>
                  EcoattiviRankingComuneMapper().fromDTO(comuneDto))
              .toList() ??
          [],
    );
  }

  @override
  EcoattiviRankingDto toDTO(EcoattiviRanking model) {
    return EcoattiviRankingDto(
      resultCode: model.resultCode,
      errorMessage: model.errorMessage,
      classificaNazionale: model.classificaNazionale,
      numIscrittiTotali: model.numIscrittiTotali,
      puntiProssimoNazionale: model.puntiProssimoNazionale,
      posizioneProssimoNazionale: model.posizioneProssimoNazionale,
      classificaLocale: model.classificaLocale,
      numIscrittiComune: model.numIscrittiComune,
      puntiProssimoLocale: model.puntiProssimoLocale,
      posizioneProssimoLocale: model.posizioneProssimoLocale,
      numComuni: model.numComuni,
      comuni: model.comuni
          ?.map((comune) => EcoattiviRankingComuneMapper().toDTO(comune))
          .toList(),
    );
  }
}
