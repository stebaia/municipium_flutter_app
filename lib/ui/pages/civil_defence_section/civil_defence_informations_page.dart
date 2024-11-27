import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/bloc/civil_defence_bloc/civil_defence_info_bloc/civil_defence_info_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/model/civil_defence/civil_defence_list_informations.dart';
import 'package:municipium/ui/components/dialogs/download_progress_dialog.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class CivilDefenceInformationsPage extends StatefulWidget
    implements AutoRouteWrapper {
  const CivilDefenceInformationsPage({super.key});

  @override
  State<CivilDefenceInformationsPage> createState() =>
      _CivilDefenceInformationsPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => CivilDefenceInfoBloc(
              civilDefenceRepository: context.read())
            ..fetchCivilDefenceInformations(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
        )
      ], child: this);
}

class _CivilDefenceInformationsPageState
    extends State<CivilDefenceInformationsPage> {
  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.civil_defence_info.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: BlocBuilder<CivilDefenceInfoBloc,
                CivilDefenceInformationsState>(builder: (context, state) {
              if (state is FetchingCivilDefenceInformationsState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchedCivilDefenceInformationsState) {
                return ListView.builder(
                    itemCount: state.civilDefenceInformations.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Html(
                                data: state
                                    .civilDefenceInformations[index].content,
                                onLinkTap: (url, attributes, element) async {
                                  await launchUrl(Uri.parse(url!));
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    _dialogBuilder(
                                        context,
                                        state.civilDefenceInformations[index]
                                            .attachments!);
                                  },
                                  child: Text(AppLocalizations.of(context)!
                                      .text_attachment_and_planning
                                      .toUpperCase()))
                            ],
                          ),
                        ));
              } else {
                return Container();
              }
            })));
  }

  Future<void> _dialogBuilder(
      BuildContext context, List<Attachments> attachments) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
                AppLocalizations.of(context)!.text_attachment_and_planning),
            content: Container(
              height: attachments.length > 6 ? attachments.length * 60 : 400,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: attachments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(attachments[index].name!),
                      leading: IconButton(
                          onPressed: () async {
                            bool result = await _permissionRequest();
                            if (result) {
                              showDialog(
                                  context: context,
                                  builder: (dialogcontext) {
                                    return DownloadProgressDialog(url: "${attachments[index].site}${attachments[index].file}", name: '${attachments[index].name}.${attachments[index].extension}');
                                  });
                            }
                          },
                          icon: const Icon(CupertinoIcons.cloud_download)));
                },
              ),
            ));
      },
    );
  }

  static Future<bool> _permissionRequest() async {
    PermissionStatus result;
    result = await Permission.storage.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
