class SurveyPostRequest {
  List<Answers>? answers;
  String? udid;
  bool? ended;
  bool? isHeader;
  int? participants;
  int? id;
  bool? visible;
  bool? voted;

  SurveyPostRequest(
      {this.answers,
      this.udid,
      this.ended,
      this.isHeader,
      this.participants,
      this.id,
      this.visible,
      this.voted});

  SurveyPostRequest.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
    udid = json['udid'];
    ended = json['ended'];
    isHeader = json['isHeader'];
    participants = json['participants'];
    id = json['id'];
    visible = json['visible'];
    voted = json['voted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['udid'] = this.udid;
    data['ended'] = this.ended;
    data['isHeader'] = this.isHeader;
    data['participants'] = this.participants;
    data['id'] = this.id;
    data['visible'] = this.visible;
    data['voted'] = this.voted;
    return data;
  }
}

class Answers {
  List<int>? answerIds;
  String? answer;
  int? questionId;
  String? type;


  Answers({this.answerIds, this.questionId, this.answer, this.type});

  Answers.fromJson(Map<String, dynamic> json) {
    answerIds = json['answer_ids'].cast<int>();
    questionId = json['question_id'];
    answer = json['answer'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_ids'] = this.answerIds;
    data['question_id'] = this.questionId;
    data['answer'] = this.answer;
    data['type'] = this.type;
    return data;
  }
}
