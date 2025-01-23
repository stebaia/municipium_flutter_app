import 'package:municipium/model/ecoattivi/ecoattivi_quiz_detail.dart';
import 'package:municipium/repositories/mappers/ecoattivi_mapper/ecoattivi_question_mapper.dart';
import 'package:municipium/repositories/mappers/ecoattivi_mapper/ecoattivi_user_answer_mapper.dart';
import 'package:municipium/services/network/dto/ecoattivi_quiz_detail_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviQuizDetailMapper
    extends DTOMapper<EcoattiviQuizDetailDto, EcoattiviQuizDetail> {
  final EcoattiviQuestionMapper questionMapper = EcoattiviQuestionMapper();
  final EcoattiviUserAnswerMapper userAnswerMapper =
      EcoattiviUserAnswerMapper();

  @override
  EcoattiviQuizDetail fromDTO(EcoattiviQuizDetailDto dto) {
    return EcoattiviQuizDetail(
      quizId: dto.quizId ?? 0,
      puntiDomanda: dto.puntiDomanda ?? 0,
      domande: dto.domande
              ?.map((questionDto) => questionMapper.fromDTO(questionDto))
              .toList() ??
          [],
      risposteUtente: dto.risposteUtente
              ?.map((userAnswerDto) => userAnswerMapper.fromDTO(userAnswerDto))
              .toList() ??
          [],
    );
  }

  @override
  EcoattiviQuizDetailDto toDTO(EcoattiviQuizDetail model) {
    return EcoattiviQuizDetailDto(
      quizId: model.quizId,
      puntiDomanda: model.puntiDomanda,
      domande: model.domande
          ?.map((question) => questionMapper.toDTO(question))
          .toList(),
      risposteUtente: model.risposteUtente
          ?.map((userAnswer) => userAnswerMapper.toDTO(userAnswer))
          .toList(),
    );
  }
}
