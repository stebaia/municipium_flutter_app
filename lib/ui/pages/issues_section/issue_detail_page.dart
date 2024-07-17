import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/issue_detail_bloc/issue_detail_bloc.dart';
import 'package:municipium/model/issue/issue_Detail.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/ui/components/horizzontal_gallery.dart';
import 'package:municipium/ui/components/shimmers/shimmer_detail_component.dart';
import 'package:municipium/ui/components/tag_label_bkg.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class IssueDetailPage extends StatelessWidget implements AutoRouteWrapper {
  IssueDetailPage({super.key, required this.id, required this.udid});

  int id;
  String udid;

  @override
  Widget build(BuildContext context) {
    Municipality municipality = (context.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.router.maybePop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<IssueDetailBloc, IssueDetailState>(
            builder: (context, state) {
              if (state is FetchingIssueDetailState) {
                return const ShimmerDetailComponent();
              } else if (state is FetchedIssueDetailState) {
                IssueDetail detail = (context.read<IssueDetailBloc>().state
                        as FetchedIssueDetailState)
                    .issueDetail;
                return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Segnalazione #${detail.id}',
                              style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.4),
                            ),
                            const SizedBox()
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(detail.issueCategory?.name ?? '',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4))
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            TagLabelBkg(
                                title: detail.closed ?? false
                                    ? 'Chiusa'
                                    : 'Aperta'),
                            const SizedBox(
                              width: 16,
                            ),
                            TagLabelBkg(
                                title: detail.merged ?? false
                                    ? 'Sincronizzato'
                                    : 'Da sincronizzare')
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Row(
                          children: [
                            Text('Dettagli segnalazione',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.4))
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Row(
                          children: [
                            Text('DATA D\'INVIO',
                                style: TextStyle(
                                    color: Color.fromRGBO(141, 144, 152, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                                MunicipiumUtility.convertDate(
                                    detail.createdAt ?? '', 'd MMM HH:mm',
                                    todayYesterdayIncluded: true),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4))
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Row(
                          children: [
                            Text('POSIZIONE',
                                style: TextStyle(
                                    color: Color.fromRGBO(141, 144, 152, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () => MunicipiumUtility.launchMapUrl(
                              detail.address ?? ''),
                          child: Row(
                            children: [
                              Text(detail.address ?? '',
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          ThemeHelper.blueMunicipium,
                                      color: ThemeHelper.blueMunicipium,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.4))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Row(
                          children: [
                            Text('TESTO SEGNALAZIONE',
                                style: TextStyle(
                                    color: Color.fromRGBO(141, 144, 152, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(detail.content ?? '',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.4)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        (detail.image != null &&
                                detail.image!.i1920x1280 != null)
                            ? const Row(
                                children: [
                                  Text('FOTO SEGNALAZIONE',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(141, 144, 152, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.4))
                                ],
                              )
                            : Container(),
                        const SizedBox(
                          height: 8,
                        ),
                        (detail.image != null &&
                                detail.image!.i1920x1280 != null)
                            ? FutureBuilder<List<XFile>>(
                                future: createImageList(detail, municipality),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text(
                                        'Errore nel caricamento delle immagini');
                                  } else if (snapshot.hasData) {
                                    return HorizzontalGallery(
                                      imageList: snapshot.data!,
                                      height: 300,
                                      title: const Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              )
                            : Container()
                      ],
                    ));
              } else if (state is NoIssueDetailState) {
                return Text('No issue detail');
              } else {
                return Text('No issue detail');
              }
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeHelper.blueMunicipium,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(20),
            ),
            child: const Text(
              'Aggiungi commento',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }

  Future<List<XFile>> createImageList(
      IssueDetail detail, Municipality municipality) async {
    List<String> listUrl = [];
    if (detail.image != null) {
      listUrl
          .add('http://${municipality.subdomain}${detail.image!.i640 ?? ''}');
    }
    if (detail.image2 != null) {
      listUrl
          .add('http://${municipality.subdomain}${detail.image2!.i640 ?? ''}');
    }
    if (detail.image3 != null) {
      listUrl
          .add('http://${municipality.subdomain}${detail.image3!.i640 ?? ''}');
    }
    if (detail.image4 != null) {
      listUrl
          .add('http://${municipality.subdomain}${detail.image4!.i640 ?? ''}');
    }
    List<XFile> xfiles = await MunicipiumUtility.downloadFilesFromUrls(listUrl);
    return xfiles;
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<IssueDetailBloc>(
          create: (context) => IssueDetailBloc(issueRepository: context.read())
            ..fetchIssueDetail(id, udid),
        )
      ], child: this);
}
