import 'package:auto_route/auto_route.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_chat_cubit/issue_chat_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/issue/issue_chat.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/dto/chat_post_issue_dto.dart';
import 'package:municipium/services/network/dto/issue_detail_dto.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ChatMessagePage extends StatefulWidget implements AutoRouteWrapper {
  ChatMessagePage(
      {super.key,
      required this.messages,
      required this.title,
      required this.issueId,
      required this.municName});
  final List<IssueChatItem> messages;
  final String title;
  final int issueId;
  final String municName;

  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<IssueChatCubit>(
          create: (context) =>
              IssueChatCubit(chat: messages, issuesRepository: context.read()),
        ),
        BlocProvider<MunicipalityBloc>(
          create: (context) =>
              MunicipalityBloc(municipalityRepository: context.read())
                ..getDevice(),
        ),
      ], child: this);
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //final focusNode = FocusNode();
  String? textUser;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    IssueChatCubit issueChatCubit = context.read<IssueChatCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4)),
      ), // <-- App bar
      body: BlocBuilder<IssueChatCubit, List<IssueChatItem>>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.separated(
                      shrinkWrap: true,
                      reverse: true,
                      padding: const EdgeInsets.only(top: 12, bottom: 20) +
                          const EdgeInsets.symmetric(horizontal: 12),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 12,
                      ),
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        bool user = state[index].isByUser ?? false;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!user)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Comune di ${widget.municName}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.4),
                                ),
                              ),
                            Bubble(
                              padding: const BubbleEdges.all(10),
                              margin: user
                                  ? const BubbleEdges.only(left: 40.0)
                                  : const BubbleEdges.only(right: 40.0),
                              alignment:
                                  user ? Alignment.topRight : Alignment.topLeft,
                              nip:
                                  user ? BubbleNip.rightTop : BubbleNip.leftTop,
                              color: user
                                  ? ThemeHelper.greyFine
                                  : ThemeHelper.greyAccent,
                              child: Column(
                                crossAxisAlignment: user
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(state[index].email ?? '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                  if ((state[index].emailDate ?? '').isNotEmpty)
                                    Text(
                                        MunicipiumUtility.convertDate(
                                            state[index].emailDate!, 'd MMM',
                                            todayYesterdayIncluded: true,
                                            startFormat: 'dd.MM.yyyy',
                                            withHours: false),
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                141, 144, 152, 1),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )),
              ),
              //_BottomInputField(), // <- Fixed bottom TextField widget
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) => textUser = value,
                          key: _formKey,
                          style: const TextStyle(color: Colors.black),
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: 'Scrivi un messaggio...',
                            border: InputBorder.none,
                          ),
                          //style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      IconButton(
                        iconSize: 32,
                        onPressed: () async {
                          final DeviceBe? device = await context
                              .read<MunicipalityBloc>()
                              .getDevice();
                          DateTime now = DateTime.now();
                          issueChatCubit.addMessageToChat(
                              IssueChatItem(
                                  email: textUser,
                                  emailDate:
                                      '${now.day}.${now.month}.${now.year}',
                                  isByUser: true),
                              device?.udid ?? '',
                              widget.issueId, () {
                            _controller.clear();
                          });
                        },
                        icon: const Icon(Icons.send_outlined),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              )
            ],
          );
        },
      ),
    );
  }
}
