import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/event_list_bloc/event_list_bloc.dart';
import 'package:municipium/model/events/event_item_list.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/ui/components/detail_image_box.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:municipium/utils/theme_helper.dart';

@RoutePage()
class EventListPage extends StatefulWidget implements AutoRouteWrapper {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<EventListBloc>(
          create: (context) =>
              EventListBloc(eventsRepository: context.read())..fetchEventList(),
        )
      ], child: this);
}

class _EventListPageState extends State<EventListPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MenuDrawer(
          mContext: context,
          scaffoldKey: _scaffoldKey,
        ),
        appBar: AppBar(
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Cerca...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: ((value) =>
                      context.read<EventListBloc>().filterEventList(value)),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.events_menu.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
          leading: IconButton(
            onPressed: () => context.router.popUntil(
                (route) => route.settings.name == CoreMunicipalityRoute.name),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                  if (!_isSearching) {
                    // Clear search when closing the search
                    _searchController.clear();
                    context.read<EventListBloc>().filterEventList('');
                  }
                });
              },
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: false,
        body: Container(child: BlocBuilder<EventListBloc, EventListState>(
          builder: (context, state) {
            List<EventItemList> eventsToShow =
                (context.read<EventListBloc>().allEvents);
            if (_isSearching) {
              eventsToShow = (context.read<EventListBloc>().allEventsFiltered);
            }
            if (state is FetchingEventListState && eventsToShow.isEmpty) {
              return ShimmerUtils.buildShimmer(6);
            } else if (state is FetchedEventListState) {
              context.read<EventListBloc>().isFetching = false;
            } else if (state is NoEventListState) {
              return Center(
                child: Text(AppLocalizations.of(context)!.no_news_fetched),
              );
            }
            return ListView.builder(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !context.read<EventListBloc>().isFetching &&
                      !_isSearching) {
                    context.read<EventListBloc>()
                      ..isFetching = true
                      ..add(const FetchEventListEvent());
                  }
                }),
              itemCount: eventsToShow.length,
              itemBuilder: ((context, index) => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailImageBox(
                            baseUrl: eventsToShow[index].images.baseUrl,
                            url: eventsToShow[index].images.i1920x1280,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  eventsToShow[index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                MunicipiumUtility.convertDate(
                                  eventsToShow[index].publishedAt,
                                  'dd.MM.yyyy',
                                ),
                                style: const TextStyle(
                                  color: Color.fromRGBO(188, 191, 200, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            eventsToShow[index].description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color?>(
                                          ThemeHelper.blueMunicipium),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.read_more,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  context.pushRoute(EventDetailRoute(
                                    eventId: eventsToShow[index].id,
                                  ));
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      context.pushRoute(EventDetailRoute(
                        eventId: 60189, //eventsToShow[index].id,
                      ));
                    },
                  )),
            );
          },
        )));
  }
}
