import 'package:municipium/model/ecoattivi/ecoattivi_user_answer.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_quiz_detail_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviUserAnswerMapper
    extends DTOMapper<EcoattiviUserAnswerDto, EcoattiviUserAnswer> {
  @override
  EcoattiviUserAnswer fromDTO(EcoattiviUserAnswerDto dto) {
    return EcoattiviUserAnswer(
      domandaId: dto.domandaId ?? 0,
      rispostaId: dto.rispostaId ?? 0,
    );
  }

  @override
  EcoattiviUserAnswerDto toDTO(EcoattiviUserAnswer model) {
    return EcoattiviUserAnswerDto(
      domandaId: model.domandaId,
      rispostaId: model.rispostaId,
    );
  }
}
