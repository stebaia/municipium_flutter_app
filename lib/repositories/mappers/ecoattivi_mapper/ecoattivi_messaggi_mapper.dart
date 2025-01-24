import 'package:municipium/model/ecoattivi/ecoattivi_message.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_message_response.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviMessaggiMapper
    extends DTOMapper<EcoattiviMessaggioDto, EcoattiviMessage> {
  @override
  EcoattiviMessage fromDTO(EcoattiviMessaggioDto dto) {
    return EcoattiviMessage(
        messaggioId: dto.messaggioId,
        letto: dto.letto,
        data: dto.data,
        titolo: dto.titolo,
        url: dto.url);
  }

  @override
  EcoattiviMessaggioDto toDTO(EcoattiviMessage model) {
    return EcoattiviMessaggioDto();
  }
}
