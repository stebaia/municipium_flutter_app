import 'package:municipium/model/pnrr/body_pnrr.dart';
import 'package:municipium/model/pnrr/body_pnrr_response.dart';
import 'package:municipium/services/network/dto/pnrr_body_dto.dart';
import 'package:pine/pine.dart';

class BodyResponsePnrrMapper
    extends DTOMapper<PnrrBodyResponseDto, BodyPnrrResponse> {
  @override
  BodyPnrrResponse fromDTO(PnrrBodyResponseDto dto) {
    BodyPnrrMapper pnrrBodyMapper = BodyPnrrMapper();
    List<BodyPnrr> bodyList = [];
    for (var element in dto.body ?? []) {
      bodyList.add(pnrrBodyMapper.fromDTO(element));
    }
    return BodyPnrrResponse(
        subtitle: dto.subtitle,
        id: dto.id,
        state: dto.state,
        shortDescription: dto.shortDescription,
        title: dto.title,
        body: bodyList,
        argomenti: dto.argomenti);
  }

  @override
  PnrrBodyResponseDto toDTO(BodyPnrrResponse model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}

class BodyPnrrMapper extends DTOMapper<PnrrBodyDto, BodyPnrr> {
  @override
  BodyPnrr fromDTO(PnrrBodyDto dto) {
    return BodyPnrr(
        values: dto.values,
        name: dto.name,
        type: dto.type,
        value: dto.value,
        urlPrenotazione: dto.urlPrenotazione,
        url: dto.url,
        content: dto.content);
  }

  @override
  PnrrBodyDto toDTO(BodyPnrr model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}
