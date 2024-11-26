import 'package:municipium/model/ecoattivi/ecoattivi_azione.dart';
import 'package:municipium/services/network/dto/ecoattivi_azione_dto.dart';
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
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}
