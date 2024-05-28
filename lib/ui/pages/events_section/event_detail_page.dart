import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/event_detail_bloc/event_detail_bloc.dart';
import 'package:municipium/ui/components/detail_gallery_box.dart';
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
                      const SizedBox(
                        height: 24,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ComponentFactory.checkAndCreateRow(
                          'Da ${MunicipiumUtility.convertDate(state.eventDetail.startDate ?? '', 'dd MMM yyyy')}, ${MunicipiumUtility.convertDate(state.eventDetail.startTime ?? '', 'HH.mm')} a ${MunicipiumUtility.convertDate(state.eventDetail.endDate ?? '', 'dd MMM yyyy')}, ${MunicipiumUtility.convertDate(state.eventDetail.endTime ?? '', 'HH.mm')}',
                          Icons.calendar_month, () {
                        MunicipiumUtility.launchMapUrl(
                            state.eventDetail.address!);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      ComponentFactory.checkAndCreateRow(
                          state.eventDetail.address, Icons.location_on_outlined,
                          () {
                        MunicipiumUtility.launchMapUrl(
                            state.eventDetail.address!);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      ComponentFactory.checkAndCreateRow(
                          state.eventDetail.url, Icons.link, () {
                        MunicipiumUtility.launch(state.eventDetail.url!);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      ComponentFactory.checkAndCreateRow(
                          state.eventDetail.costo, Icons.payments, () {}),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
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
                      ),
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
