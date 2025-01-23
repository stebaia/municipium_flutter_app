import 'package:municipium/model/ecoattivi/ecoattivi_user_answer.dart';
import 'package:municipium/services/network/dto/ecoattivi_quiz_detail_dto.dart';

class AggiornaQuizBody {
  int? quizId;
  bool? monetizza;
  List<EcoattiviUserAnswer>? risposte;
  int? punti;

  AggiornaQuizBody(
      {required this.quizId,
      required this.monetizza,
      required this.risposte,
      required this.punti});

  factory AggiornaQuizBody.fromJson(Map<String, dynamic> json) {
    return AggiornaQuizBody(
      quizId: json['quizId'] as int?,
      monetizza: json['monetizza'] as bool?,
      risposte: (json['risposte'] as List<dynamic>?)
          ?.map((e) => EcoattiviUserAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      punti: json['punti'] as int?,
    );
  }

  // Funzione per convertire il modello in un oggetto JSON
  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'monetizza': monetizza,
      'risposte': risposte?.map((e) => e.toJson()).toList(),
      'punti': punti,
    };
  }
}
