import 'package:pine/dto/dto.dart';

class ChatPostIssueDto extends DTO {
  int? id;
  String? issueNotes;
  String? udid;

  ChatPostIssueDto(
      {required this.id, required this.issueNotes, required this.udid});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'udid': udid,
      'issue_notes': issueNotes,
    };
  }
}

class ChatResponse {
  bool? success;
  int? id;
  String? message;

  ChatResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    success = json['success'];
    message = json['message'];
  }
}
