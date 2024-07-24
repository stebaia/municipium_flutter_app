import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/issue/issue_chat.dart';
import 'package:municipium/repositories/issues_repository.dart';
import 'package:municipium/services/network/dto/chat_post_issue_dto.dart';
import 'package:municipium/services/network/dto/issue_detail_dto.dart';

class IssueChatCubit extends Cubit<List<IssueChatItem>> {
  List<IssueChatItem> chat;
  IssuesRepository issuesRepository;

  IssueChatCubit({required this.chat, required this.issuesRepository})
      : super(chat);

  addMessageToChat(
      IssueChatItem message, String udid, int id, Function() action) async {
    postIssue(ChatPostIssueDto(id: id, issueNotes: message.email, udid: udid),
        () {
      final List<IssueChatItem> list = chat..insert(0, message);
      emit(list);
      action();
    });
  }

  postIssue(ChatPostIssueDto item, Function()? action) async {
    issuesRepository.postMessage(item, action);
  }
}
