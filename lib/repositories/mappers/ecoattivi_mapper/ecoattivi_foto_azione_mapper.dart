import 'package:municipium/model/ecoattivi/ecoattivi_foto_azione.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_foto_azione_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviFotoAzioneMapper
    extends DTOMapper<EcoattiviFotoAzioneDto, EcoattiviFotoAzione> {
  @override
  EcoattiviFotoAzione fromDTO(EcoattiviFotoAzioneDto dto) {
    return EcoattiviFotoAzione(
      azioneId: dto.azioneId ?? 0,
      titolo: dto.titolo ?? '',
      desc: dto.desc ?? '',
      punti: dto.punti ?? 0,
      eseguita: dto.eseguita ?? false,
    );
  }

  @override
  EcoattiviFotoAzioneDto toDTO(EcoattiviFotoAzione model) {
    return EcoattiviFotoAzioneDto(
      azioneId: model.azioneId,
      titolo: model.titolo,
      desc: model.desc,
      punti: model.punti,
      eseguita: model.eseguita,
    );
  }
}
