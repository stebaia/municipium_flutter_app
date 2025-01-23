import 'package:municipium/model/ecoattivi/ecoattivi_missione.dart';
import 'package:municipium/services/network/dto/ecoattivi_missione_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviMissioniMapper
    extends DTOMapper<EcoattiviMissioneDto, EcoattiviMissione> {
  @override
  EcoattiviMissione fromDTO(EcoattiviMissioneDto dto) {
    return EcoattiviMissione(
      sfidaMissioneId: dto.sfidaMissioneId ?? 0,
      tipo: dto.tipo ?? 0,
      titolo: dto.titolo ?? '',
      descHtml: dto.descHtml ?? '',
      descTxt: dto.descTxt ?? '',
      dataInizio: dto.dataInizio ?? '',
      dataFine: dto.dataFine ?? '',
      puntiPalio: dto.puntiPalio ?? 0,
      statoSfidaMissioneId: dto.statoSfidaMissioneId ?? 0,
      statoSfidaMissioneDesc: dto.statoSfidaMissioneDesc ?? '',
      statoIscrizioneId: dto.statoIscrizioneId ?? 0,
      statoIscrizioneDesc: dto.statoIscrizioneDesc ?? '',
      obiettivoNumero: dto.obiettivoNumero ?? 0,
      obiettivoUnitaMisura: dto.obiettivoUnitaMisura ?? '',
      progressoNumero: dto.progressoNumero ?? 0,
    );
  }

  @override
  EcoattiviMissioneDto toDTO(EcoattiviMissione model) {
    return EcoattiviMissioneDto(
      sfidaMissioneId: model.sfidaMissioneId,
      tipo: model.tipo,
      titolo: model.titolo,
      descHtml: model.descHtml,
      descTxt: model.descTxt,
      dataInizio: model.dataInizio,
      dataFine: model.dataFine,
      puntiPalio: model.puntiPalio,
      statoSfidaMissioneId: model.statoSfidaMissioneId,
      statoSfidaMissioneDesc: model.statoSfidaMissioneDesc,
      statoIscrizioneId: model.statoIscrizioneId,
      statoIscrizioneDesc: model.statoIscrizioneDesc,
      obiettivoNumero: model.obiettivoNumero,
      obiettivoUnitaMisura: model.obiettivoUnitaMisura,
      progressoNumero: model.progressoNumero,
    );
  }
}
