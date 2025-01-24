import 'package:municipium/model/ecoattivi/ecoattivi_answer.dart';
import 'package:municipium/services/network/dto/ecoattivi/ecoattivi_quiz_detail_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviAnswerMapper
    extends DTOMapper<EcoattiviAnswerDto, EcoattiviAnswer> {
  @override
  EcoattiviAnswer fromDTO(EcoattiviAnswerDto dto) {
    return EcoattiviAnswer(
      rispostaId: dto.rispostaId ??
          0, // Puoi impostare un valore predefinito se necessario
      testo: dto.testo ?? '',
      progressivo: dto.progressivo ?? 0,
      rispostaEsatta: dto.rispostaEsatta ?? false,
    );
  }

  @override
  EcoattiviAnswerDto toDTO(EcoattiviAnswer model) {
    return EcoattiviAnswerDto(
      rispostaId: model.rispostaId,
      testo: model.testo,
      progressivo: model.progressivo,
      rispostaEsatta: model.rispostaEsatta,
    );
  }
}
