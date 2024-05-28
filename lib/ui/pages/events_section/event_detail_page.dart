import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/event_detail_bloc/event_detail_bloc.dart';
import 'package:municipium/ui/components/detail_gallery_box.dart';
import 'package:municipium/ui/components/row_pnnr_components/row_contact_point.dart';
import 'package:municipium/ui/components/row_pnnr_components/row_pnnr_component.dart';
import 'package:municipium/utils/component_factory.dart';
import 'package:municipium/utils/municipium_utility.dart';

@RoutePage()
class EventDetailPage extends StatelessWidget implements AutoRouteWrapper {
  const EventDetailPage({super.key, required this.eventId});
  final int eventId;

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<EventDetailBLoc>(
          create: (context) => EventDetailBLoc(eventRepository: context.read())
            ..fetchEventDetail(eventId),
        )
      ], child: this);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => context.maybePop(),
          ),
        ),
        body: BlocBuilder<EventDetailBLoc, EventDetailState>(
          builder: (context, state) {
            if (state is FetchingEventDetailState) {
              return const CircularProgressIndicator();
            } else if (state is FetchedEventDetailState) {
              return SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.eventDetail.title ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 28)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined),
                          const SizedBox(width: 8),
                          Text(
                              MunicipiumUtility.convertDate(
                                  state.eventDetail.publishedAt ?? '',
                                  'dd.MM.yyyy'),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 17))
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      DetailGalleryBox(
                          image: state.eventDetail.image,
                          images: state.eventDetail.images,
                          pageController: pageController),
                      const SizedBox(
                        height: 24,
                      ),
                      Html(
                        data: state.eventDetail.content ?? '',
                      ),
                      Text(
                        state.eventDetail.eventCategories!
                            .map((e) => e.name)
                            .join(', '),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      buildRowElement(Icons.calendar_month,
                          'Da ${MunicipiumUtility.convertDate(state.eventDetail.startDate ?? '', 'dd MMM yyyy')}, ${MunicipiumUtility.convertDate(state.eventDetail.startTime ?? '', 'HH.mm')} a ${MunicipiumUtility.convertDate(state.eventDetail.endDate ?? '', 'dd MMM yyyy')}, ${MunicipiumUtility.convertDate(state.eventDetail.endTime ?? '', 'HH.mm')}',
                          () {
                        MunicipiumUtility.launchMapUrl(
                            state.eventDetail.address!);
                      }),
                      buildRowElement(
                          Icons.location_on_outlined, state.eventDetail.address,
                          () {
                        MunicipiumUtility.launchMapUrl(
                            state.eventDetail.address!);
                      }),
                      buildRowElement(Icons.link, state.eventDetail.url, () {
                        MunicipiumUtility.launch(state.eventDetail.url!);
                      }),
                      buildRowElement(
                          Icons.payments,
                          MunicipiumUtility.removeHtmlTags(
                              state.eventDetail.costo ?? ''),
                          () {}),
                      const SizedBox(
                        height: 24,
                      ),
                      buildCreditsRow('Rivolto a', state.eventDetail.rivoltoA),
                      buildCreditsRow(
                          'Patrocinato da', state.eventDetail.patrocinatoDa),
                      buildCreditsRow('Sponsor', state.eventDetail.sponsorPnrr),
                      buildCreditsRow('Ulteriori informazioni',
                          state.eventDetail.ulterioriInformazioni),
                      RowContactPoint(
                          contactsPoint: state.eventDetail.puntiContatto),

                      /*Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              ComponentFactory.checkAndCreateMultiRow(
                                  state.eventDetail.rivoltoA, 'Rivolto a'),
                              const SizedBox(
                                height: 16,
                              ),
                              ComponentFactory.checkAndCreateMultiRow(
                                  state.eventDetail.patrocinatoDa,
                                  'Patrocinato da '),
                              const SizedBox(
                                height: 16,
                              ),
                              ComponentFactory.checkAndCreateMultiRow(
                                state.eventDetail.sponsorPnrr,
                                'Sponsor ',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ComponentFactory.checkAndCreateMultiRow(
                                state.eventDetail.ulterioriInformazioni,
                                'Ulteriori informazioni ',
                              ),
                            ],
                          ),
                        ),
                      ),*/
                      const SizedBox(
                        height: 16,
                      ),
                      buildLinkBox(
                          'Persone',
                          state.eventDetail.persone
                              ?.map((e) => e.name)
                              .toList(),
                          state.eventDetail.persone
                              ?.map((e) => () {})
                              .toList()),
                      buildLinkBox(
                          'Argomenti',
                          state.eventDetail.argomenti
                              ?.map((e) => e.name)
                              .toList(),
                          state.eventDetail.argomenti
                              ?.map((e) => () {})
                              .toList()),
                      buildLinkBox(
                          'Supportato da',
                          state.eventDetail.supportatoDa
                              ?.map((e) => e.titolo)
                              .toList(),
                          state.eventDetail.supportatoDa
                              ?.map((e) => () {})
                              .toList()),
                      buildLinkBox(
                          'Evento genitore',
                          state.eventDetail.parent != null
                              ? [state.eventDetail.parent?.parentTitle]
                              : [],
                          [() {}]),
                      buildLinkBox(
                          'Eventi figli',
                          state.eventDetail.childs
                              ?.map((e) => e.child_title)
                              .toList(),
                          state.eventDetail.childs?.map((e) => () {}).toList()),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Errore'),
              );
            }
          },
        ));
  }
}
