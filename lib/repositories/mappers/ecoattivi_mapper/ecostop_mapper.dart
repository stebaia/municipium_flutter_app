import 'package:municipium/model/ecoattivi/ecostop.dart';
import 'package:municipium/services/network/dto/ecostop_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcostopMapper extends DTOMapper<EcostopDto, Ecostop> {
  @override
  Ecostop fromDTO(EcostopDto dto) {
    return Ecostop(
      ecostopId: dto.ecostopId ?? 0,
      titolo: dto.titolo ?? '',
      descHtml: dto.descHtml ?? '',
      desctxt: dto.desctxt ?? '',
      urlEcoStop: dto.urlEcoStop ?? '',
      indirizzo: dto.indirizzo ?? '',
      comune: dto.comune ?? '',
      provincia: dto.provincia ?? '',
      regione: dto.regione ?? '',
      lat: dto.lat ?? 0.0,
      lon: dto.lon ?? 0.0,
      tipoId: dto.tipoId ?? 0,
      tipoDesc: dto.tipoDesc ?? '',
      tipoColore: dto.tipoColore ?? '',
    );
  }

  @override
  EcostopDto toDTO(Ecostop model) {
    return EcostopDto(
      ecostopId: model.ecostopId,
      titolo: model.titolo,
      descHtml: model.descHtml,
      desctxt: model.desctxt,
      urlEcoStop: model.urlEcoStop,
      indirizzo: model.indirizzo,
      comune: model.comune,
      provincia: model.provincia,
      regione: model.regione,
      lat: model.lat,
      lon: model.lon,
      tipoId: model.tipoId,
      tipoDesc: model.tipoDesc,
      tipoColore: model.tipoColore,
    );
  }
}
