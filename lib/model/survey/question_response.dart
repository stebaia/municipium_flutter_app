class QuestionResponse {
  final int id;
  final String title;
  final String startMessage;
  final String endMessage;
  final String startDate;
  final String endDate;
  final bool visible;
  final bool voted;
  final List<Questions> questions;

  QuestionResponse({
    required this.id,
    required this.title,
    required this.startMessage,
    required this.endMessage,
    required this.startDate,
    required this.endDate,
    required this.visible,
    required this.voted,
    required this.questions,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) {
    return QuestionResponse(
      id: json['id'],
      title: json['title'],
      startMessage: json['start_message'],
      endMessage: json['end_message'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      visible: json['visible'],
      voted: json['voted'],
      questions: (json['questions'] as List)
          .map((v) => Questions.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'start_message': startMessage,
      'end_message': endMessage,
      'start_date': startDate,
      'end_date': endDate,
      'visible': visible,
      'voted': voted,
      'questions': questions.map((v) => v.toJson()).toList(),
    };
  }
}

class Questions {
  final String? questionMinValue;
  final String question;
  final int questionId;
  final String questionType;
  final String? questionMaxValue;
  final List<String>? answers;

  Questions({
    required this.questionMinValue,
    required this.question,
    required this.questionId,
    required this.questionType,
    required this.questionMaxValue,
    required this.answers,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      questionMinValue: json['question_min_value'],
      question: json['question'],
      questionId: json['question_id'],
      questionType: json['question_type'],
      questionMaxValue: json['question_max_value'],
      answers: json['answers'] != null ? (json['answers'] as List).cast<String>() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_min_value': questionMinValue,
      'question': question,
      'question_id': questionId,
      'question_type': questionType,
      'question_max_value': questionMaxValue,
      'answers': answers,
    };
  }
}
