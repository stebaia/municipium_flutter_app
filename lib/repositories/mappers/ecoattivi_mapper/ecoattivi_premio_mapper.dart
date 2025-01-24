import 'package:municipium/model/ecoattivi/ecoattivi_premio.dart';
import 'package:municipium/repositories/mappers/ecoattivi_mapper/ecoattivi_requisito_mapper.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_premio_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviPremioMapper
    extends DTOMapper<EcoattiviPremioDto, EcoattiviPremio> {
  @override
  EcoattiviPremio fromDTO(EcoattiviPremioDto dto) {
    return EcoattiviPremio(
      riscattoId: dto.riscattoId ?? 0,
      dataInizio: dto.dataInizio ?? '',
      dataFine: dto.dataFine ?? '',
      titolo: dto.titolo ?? '',
      iscrizioneAbilitata: dto.iscrizioneAbilitata ?? false,
      premioSingolare: dto.premioSingolare ?? '',
      premioPlurale: dto.premioPlurale ?? '',
      conversione: dto.conversione ?? 0,
      conversionePeriodica: dto.conversionePeriodica ?? false,
      saldoPremi: dto.saldoPremi ?? 0,
      urlBanner: dto.urlBanner ?? '',
      descHtml: dto.descHtml ?? '',
      descTxt: dto.descTxt ?? '',
      schedaUtentiIscritti: dto.schedaUtentiIscritti ?? '',
      regolamento: dto.regolamento ?? '',
      statoUtenteCausale: dto.statoUtenteCausale ?? '',
      dedicato: dto.dedicato ?? false,
      numPuntiConvertibili: dto.numPuntiConvertibili ?? 0,
      descPuntiConvertibili: dto.descPuntiConvertibili ?? '',
      statoPremiPrincipale: dto.statoPremiPrincipale ?? '',
      statoPremiSecondario: dto.statoPremiSecondario ?? '',
      dettaglioPremi: dto.dettaglioPremi ?? '',
      statoRiscattoId: dto.statoRiscattoId ?? 0,
      statoUtenteId: dto.statoUtenteId ?? 0,
      requisito: dto.requisito
              ?.map((requisitoDto) =>
                  EcoattiviRequisitoMapper().fromDTO(requisitoDto))
              .toList() ??
          [],
    );
  }

  @override
  EcoattiviPremioDto toDTO(EcoattiviPremio model) {
    return EcoattiviPremioDto(
      riscattoId: model.riscattoId,
      dataInizio: model.dataInizio,
      dataFine: model.dataFine,
      titolo: model.titolo,
      iscrizioneAbilitata: model.iscrizioneAbilitata,
      premioSingolare: model.premioSingolare,
      premioPlurale: model.premioPlurale,
      conversione: model.conversione,
      conversionePeriodica: model.conversionePeriodica,
      saldoPremi: model.saldoPremi,
      urlBanner: model.urlBanner,
      descHtml: model.descHtml,
      descTxt: model.descTxt,
      schedaUtentiIscritti: model.schedaUtentiIscritti,
      regolamento: model.regolamento,
      statoUtenteCausale: model.statoUtenteCausale,
      dedicato: model.dedicato,
      numPuntiConvertibili: model.numPuntiConvertibili,
      descPuntiConvertibili: model.descPuntiConvertibili,
      statoPremiPrincipale: model.statoPremiPrincipale,
      statoPremiSecondario: model.statoPremiSecondario,
      dettaglioPremi: model.dettaglioPremi,
      statoRiscattoId: model.statoRiscattoId,
      statoUtenteId: model.statoUtenteId,
      requisito: model.requisito
          ?.map((requisito) => EcoattiviRequisitoMapper().toDTO(requisito))
          .toList(),
    );
  }
}
