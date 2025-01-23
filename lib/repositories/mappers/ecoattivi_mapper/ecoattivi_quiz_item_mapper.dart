import 'package:municipium/model/ecoattivi/ecoattivi_quiz.dart';
import 'package:municipium/services/network/dto/ecoattivi_quiz_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviQuizItemMapper
    extends DTOMapper<EcoattiviQuizDto, EcoattiviQuiz> {
  @override
  EcoattiviQuiz fromDTO(EcoattiviQuizDto dto) {
    return EcoattiviQuiz(
        quizId: dto.quizId,
        desc: dto.desc,
        titolo: dto.titolo,
        descPlain: dto.descPlain,
        numTotDomande: dto.numTotDomande,
        puntiMax: dto.puntiMax,
        statoId: dto.statoId,
        risposte: dto.risposte,
        giuste: dto.giuste,
        puntiGuadagnati: dto.puntiGuadagnati);
  }

  @override
  EcoattiviQuizDto toDTO(EcoattiviQuiz model) {
    return EcoattiviQuizDto(
        quizId: model.quizId,
        desc: model.desc,
        titolo: model.titolo,
        descPlain: model.descPlain,
        numTotDomande: model.numTotDomande,
        puntiMax: model.puntiMax,
        statoId: model.statoId,
        risposte: model.risposte,
        giuste: model.giuste,
        puntiGuadagnati: model.puntiGuadagnati);
  }
}
