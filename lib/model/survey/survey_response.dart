class SurveyResponse {
  final int id;
  final String title;
  final String startMessage;
  final String endMessage;
  final String startDate;
  final String endDate;
  final bool visible;
  final List<SurveyResult> results;

  SurveyResponse({
    required this.id,
    required this.title,
    required this.startMessage,
    required this.endMessage,
    required this.startDate,
    required this.endDate,
    required this.visible,
    required this.results,
  });

  SurveyResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        startMessage = json['start_message'] as String,
        endMessage = json['end_message'] as String,
        startDate = json['start_date'] as String,
        endDate = json['end_date'] as String,
        visible = json['visible'] as bool,
        results = (json['results'] as List)
            .map((result) => SurveyResult.fromJson(result))
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'start_message': startMessage,
      'end_message': endMessage,
      'start_date': startDate,
      'end_date': endDate,
      'visible': visible,
      'results': results.map((result) => result.toJson()).toList(),
    };
  }
}

class SurveyResult {
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String answer5;
  final int answer1Votes;
  final int answer2Votes;
  final int answer3Votes;
  final int answer4Votes;
  final int answer5Votes;

  SurveyResult({
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.answer5,
    required this.answer1Votes,
    required this.answer2Votes,
    required this.answer3Votes,
    required this.answer4Votes,
    required this.answer5Votes,
  });

  SurveyResult.fromJson(Map<String, dynamic> json)
      : question = json['question'] as String,
        answer1 = json['answer1'] as String,
        answer2 = json['answer2'] as String,
        answer3 = (json['answer3'] as String?) ?? '',
        answer4 = (json['answer4'] as String?) ?? '',
        answer5 = (json['answer5'] as String?) ?? '',
        answer1Votes = json['answer1_votes'] as int,
        answer2Votes = json['answer2_votes'] as int,
        answer3Votes = json['answer3_votes'] as int,
        answer4Votes = json['answer4_votes'] as int,
        answer5Votes = json['answer5_votes'] as int;

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'answer4': answer4,
      'answer5': answer5,
      'answer1_votes': answer1Votes,
      'answer2_votes': answer2Votes,
      'answer3_votes': answer3Votes,
      'answer4_votes': answer4Votes,
      'answer5_votes': answer5Votes,
    };
  }

  // Metodo di utilità per ottenere il totale dei voti
  int get totalVotes =>
      answer1Votes + answer2Votes + answer3Votes + answer4Votes + answer5Votes;
}