import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/bloc/info_municipality_bloc/info_municipality_detail_page_bloc/bloc/info_municipality_detail_page_bloc.dart';
import 'package:municipium/model/pages/pages.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/services/network/dto/attachment_dto.dart';
import 'package:municipium/ui/components/dialogs/download_progress_dialog.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class InfoMunicipalityDetailPage extends StatelessWidget
    implements AutoRouteWrapper {
  const InfoMunicipalityDetailPage({super.key, required this.id, this.pages});
  final int id;
  final List<Pages>? pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<InfoMunicipalityDetailPageBloc, InfoMunicipalityState>(
              builder: (context, state) {
                if (state is FetchedInfoMunicipalityState) {
                   if (state.pageDetail.attachments != null &&
                  state.pageDetail.attachments!.isNotEmpty) {
                  return IconButton(
                    icon: const Icon(CupertinoIcons.paperclip),
                    onPressed: () => _dialogBuilder(context, state.pageDetail.attachments!),
                  );
                }
                }
                return Container();
              },
            )
          ],
          title: BlocBuilder<InfoMunicipalityDetailPageBloc,
              InfoMunicipalityState>(builder: (context, state) {
            if (state is FetchedInfoMunicipalityState) {
             
                return Text(
                  state.pageDetail.title,
                  style: const TextStyle(fontSize: 20),
                );
              
            }
            return Container();
          }),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<InfoMunicipalityDetailPageBloc,
              InfoMunicipalityState>(
            builder: (context, state) {
              if (state is FetchedInfoMunicipalityState) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildImages(state.pageDetail),
                        Text(
                          state.pageDetail.shortDescription ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Html(
                          data: state.pageDetail.content ?? '',
                        ),
                        pages != null && pages!.isNotEmpty
                            ? pages != null && pages!.isNotEmpty
                                ? ListView.separated(
                                    primary: false,
                                    shrinkWrap:
                                        true, // Aggiunto per calcolare l'altezza correttamente
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: pages!.length,
                                    itemBuilder: (context, index) => ListTile(
                                      title: Text(pages![index].title),
                                      trailing: const Icon(Icons.chevron_right),
                                      onTap: () => onPushFromType(
                                          context,
                                          pages![index].itemType ?? 'P',
                                          pages![index]),
                                    ),
                                  )
                                : Container()
                            : Container()
                      ],
                    ),
                  ),
                );
              } else if (state is FetchingInfoMunicipalityState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container();
              }
            },
          ),
        ));
  }

  void onPushFromType(
    BuildContext context,
    String type,
    Pages page,
  ) async {
    switch (type) {
      case 'S':
      case 'P':
        context.pushRoute(
            InfoMunicipalityDetailRoute(id: page.id, pages: page.children));
        break;
      case 'L':
        await launchUrl(Uri.parse(page.link!));
        break;
    }
  }

  Future<void> _dialogBuilder(
      BuildContext context, List<AttachmentsDTO> attachments) {
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
                                    return DownloadProgressDialog(
                                        url:
                                            "${attachments[index].cloud}${attachments[index].file}",
                                        name:
                                            '${attachments[index].name}.${attachments[index].extension}');
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

  Widget _buildImages(Pages pages) {
    if (pages.images != null) {
      if (pages.images!.length > 1) {
        return CarouselSlider(
          options: CarouselOptions(viewportFraction: 1),
          items: pages.images!
              .map((item) => Container(
                    child: Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network('${item.baseUrl}${item.i640!}',
                          fit: BoxFit.cover,
                          height: 440,
                          width: double.infinity),
                    )),
                  ))
              .toList(),
        );
      } else {
        if (pages.images != null) {
          if (pages.images!.isNotEmpty) {
            return Container(
              child: Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    '${pages.images![0].baseUrl}${pages.images![0].i640}',
                    fit: BoxFit.cover,
                    height: 400,
                    width: double.infinity),
              )),
            );
          }
        }
      }
    }
    return Container(
      decoration: BoxDecoration(
          color: ThemeHelper.blueMunicipium,
          borderRadius: BorderRadius.circular(20)),
      height: 400,
      width: double.infinity,
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

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => InfoMunicipalityDetailPageBloc(
                  infoMunicipalityRepository: context.read())
                ..fetchInfoMunicipality(
                    Provider.of<BaseUrlNotifier>(context, listen: false)
                        .baseUrl,
                    id)),
        ],
        child: this,
      );
}
