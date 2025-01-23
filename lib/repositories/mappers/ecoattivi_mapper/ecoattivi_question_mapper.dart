import 'package:municipium/model/ecoattivi/ecoattivi_question.dart';
import 'package:municipium/repositories/mappers/ecoattivi_mapper/ecoattivi_answer_mapper.dart';
import 'package:municipium/services/network/dto/ecoattivi_quiz_detail_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviQuestionMapper
    extends DTOMapper<EcoattiviQuestionDto, EcoattiviQuestion> {
  final EcoattiviAnswerMapper answerMapper = EcoattiviAnswerMapper();

  @override
  EcoattiviQuestion fromDTO(EcoattiviQuestionDto dto) {
    return EcoattiviQuestion(
      domandaId: dto.domandaId ?? 0,
      testo: dto.testo ?? '',
      progressivo: dto.progressivo ?? 0,
      //spiegazione: dto.spiegazione ?? '',
      risposte: dto.risposte
              ?.map((answerDto) => answerMapper.fromDTO(answerDto))
              .toList() ??
          [],
    );
  }

  @override
  EcoattiviQuestionDto toDTO(EcoattiviQuestion model) {
    return EcoattiviQuestionDto(
      domandaId: model.domandaId,
      testo: model.testo,
      progressivo: model.progressivo,
      // spiegazione: model.spiegazione,
      risposte:
          model.risposte?.map((answer) => answerMapper.toDTO(answer)).toList(),
    );
  }
}
