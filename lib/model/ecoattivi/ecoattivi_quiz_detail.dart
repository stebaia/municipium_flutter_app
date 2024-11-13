import 'package:municipium/model/ecoattivi/ecoattivi_question.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_user_answer.dart';

class EcoattiviQuizDetail {
  int? quizId;
  int? puntiDomanda;
  List<EcoattiviQuestion>? domande;
  List<EcoattiviUserAnswer>? risposteUtente;

  EcoattiviQuizDetail({
    this.quizId,
    this.puntiDomanda,
    this.domande,
    this.risposteUtente,
  });
}
