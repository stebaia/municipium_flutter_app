import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/pnrr_body_bloc/pnrr_body_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/row_pnnr_components/row_contact_point.dart';
import 'package:municipium/ui/components/row_pnnr_components/row_pnnr_component.dart';
import 'package:municipium/ui/components/shimmers/shimmer_detail_component.dart';
import 'package:municipium/ui/pages/online_service_detail_webview.dart';
import 'package:municipium/utils/enum.dart';

@RoutePage()
class PnrrDetailPage extends StatelessWidget implements AutoRouteWrapper {
  PnrrDetailPage({super.key, required this.type, required this.id});
  String type;
  int id;

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PnrrBodyBloc>(
          create: (context) => PnrrBodyBloc(servicesRepository: context.read())
            ..fetchBodiesPnrr(type, id),
        )
      ], child: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: BlocBuilder<PnrrBodyBloc, PnrrBodyState>(
        builder: (context, state) {
          if (state is FetchedPnrrBodyState) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          state.response.title ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 28),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 12),
                          Icon(Icons.check_circle_outlined),
                          SizedBox(width: 8),
                          Text(
                            'Servizio attivo',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    state.response.body != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.response.body?.length,
                            itemBuilder: (context, index) {
                              var body = state.response.body![index];
                              PnrrType? type =
                                  PnrrType.fromCode(body.type ?? '');
                              if (type != null) {
                                switch (type) {
                                  case PnrrType.puntiContatto:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: RowContactPoint(
                                          contactsPoint: body.content),
                                    );
                                  case PnrrType.titolo:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildDescriptionRow(
                                          body.name, body.value),
                                    );

                                  case PnrrType.allegato:
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 24.0),
                                        child: buildLinkBox(
                                          icon: Icons.attach_file,
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.name)
                                              .toList(),
                                        ));

                                  case PnrrType.unitaOrganizzativa:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.description)
                                              .toList(),
                                          onPressed: List.generate(
                                            body.content?.length ?? 0,
                                            (index) {
                                              final e = body.content![index];
                                              return () {
                                                if (e.id != null) {
                                                  context.pushRoute(PnrrDetailRoute(
                                                      type:
                                                          'unita_organizzativa',
                                                      id: e.id!));
                                                }
                                              };
                                            },
                                          )),
                                    );

                                  case PnrrType.documento:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(
                                          icon: Icons.attach_file,
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.description)
                                              .toList(),
                                          onPressed: List.generate(
                                            body.content?.length ?? 0,
                                            (index) {
                                              final e = body.content![index];
                                              return () {
                                                if (e.id != null) {
                                                  context.pushRoute(
                                                      PnrrDetailRoute(
                                                          type: 'servizio',
                                                          id: e.id!));
                                                }
                                              };
                                            },
                                          )),
                                    );

                                  case PnrrType.arrayCategory:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildDescriptionRow(
                                          body.name, body.values?.join(', ')),
                                    );

                                  case PnrrType.unitaOrganizzativaPrenotazioni:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(body.name ?? '',
                                          ['Istanza telematica'],
                                          onPressed: List.generate(
                                            1,
                                            (index) {
                                              return () {
                                                if (body.urlPrenotazione !=
                                                    null) {
                                                  context.pushRoute(
                                                      PnrrDetailWebviewRoute(
                                                          url: body
                                                              .urlPrenotazione!));
                                                }
                                              };
                                            },
                                          )),
                                    );

                                  case PnrrType.puntiDinteresse:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.description)
                                              .toList(),
                                          onPressed: body.content
                                              ?.map((e) {})
                                              .toList()),
                                    );
                                  case PnrrType.personaPubblica:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.description)
                                              .toList(),
                                          onPressed: List.generate(
                                            body.content?.length ?? 0,
                                            (index) {
                                              final e = body.content![index];
                                              return () {
                                                if (e.id != null) {
                                                  context.pushRoute(
                                                      PnrrDetailRoute(
                                                          type:
                                                              'persona_pubblica',
                                                          id: e.id!));
                                                }
                                              };
                                            },
                                          )),
                                    );

                                  case PnrrType.servizi:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.description)
                                              .toList(),
                                          onPressed: List.generate(
                                            body.content?.length ?? 0,
                                            (index) {
                                              final e = body.content![index];
                                              return () {
                                                if (e.id != null) {
                                                  context.pushRoute(
                                                      PnrrDetailRoute(
                                                          type: 'servizio',
                                                          id: e.id!));
                                                }
                                              };
                                            },
                                          )),
                                    );

                                  case PnrrType.urlDocumento:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.description)
                                              .toList(),
                                          onPressed: body.content
                                              ?.map((e) {})
                                              .toList()),
                                    );

                                  case PnrrType.incarichi:
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: buildLinkBox(
                                          body.name ?? '',
                                          body.content
                                              ?.map((e) => e.title)
                                              .toList(),
                                          onPressed: List.generate(
                                            body.content?.length ?? 0,
                                            (index) {
                                              final e = body.content![index];
                                              return () {
                                                if (e.id != null) {
                                                  context.pushRoute(
                                                      PnrrDetailRoute(
                                                          type: 'incarico',
                                                          id: e.id!));
                                                }
                                              };
                                            },
                                          )),
                                    );
                                }
                              } else {
                                return Container();
                              }
                            },
                          )
                        : Container()
                  ],
                ),
              ),
            );
          } else if (state is FetchingPnrrBodyState) {
            return const ShimmerDetailComponent();
          } else {
            return Text('Nessun dato');
          }
        },
      ),
    );
  }
}
