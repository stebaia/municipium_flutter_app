import 'package:municipium/model/ecoattivi/ecoattivi_azione.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_azione_dto.dart';
import 'package:pine/pine.dart';

class EcoattiviAzioneMapper
    extends DTOMapper<EcoattiviAzioneDto, EcoattiviAzione> {
  @override
  EcoattiviAzione fromDTO(EcoattiviAzioneDto dto) {
    return EcoattiviAzione(
        azioneId: dto.azioneId,
        titolo: dto.titolo,
        desc: dto.desc,
        punti: dto.punti,
        eseguita: dto.eseguita);
  }

  @override
  EcoattiviAzioneDto toDTO(EcoattiviAzione model) {
    return EcoattiviAzioneDto(
        azioneId: model.azioneId,
        titolo: model.titolo,
        desc: model.desc,
        punti: model.punti,
        eseguita: model.eseguita);
  }
}
