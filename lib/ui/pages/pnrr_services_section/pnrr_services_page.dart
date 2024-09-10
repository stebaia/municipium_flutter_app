import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/pnrr_services_bloc/pnrr_services_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/utils/shimmer_utils.dart';

@RoutePage()
class PnrrServicesPage extends StatefulWidget implements AutoRouteWrapper {
  PnrrServicesPage({super.key, required this.type});
  String? type;

  @override
  State<PnrrServicesPage> createState() => _PnrrServicesPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PnrrServicesBloc>(
          create: (context) =>
              PnrrServicesBloc(servicesRepository: context.read())
                ..fetchServicesPnrr(type!),
        )
      ], child: this);
}

class _PnrrServicesPageState extends State<PnrrServicesPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController _searchController = TextEditingController();
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
        key: _scaffoldKey,
        drawer: MenuDrawer(
          mContext: context,
          scaffoldKey: _scaffoldKey,
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: context.read<PnrrServicesBloc>().isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Cerca...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: ((value) => context
                      .read<PnrrServicesBloc>()
                      .filterServicesPnrr(value)),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!
                          .sportello_telematico_menu
                          .toUpperCase(),
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
                  context.read<PnrrServicesBloc>().isSearching =
                      !context.read<PnrrServicesBloc>().isSearching;
                  if (!context.read<PnrrServicesBloc>().isSearching) {
                    // Clear search when closing the search
                    _searchController.clear();
                    context.read<PnrrServicesBloc>().filterServicesPnrr('');
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
        body: BlocBuilder<PnrrServicesBloc, PnrrServiceState>(
          builder: (context, state) {
            if (state is FetchedPnrrServiceState) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            '${state.servicesList.length} servizi disponibili',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.servicesList.length,
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (state.servicesList[index].sitePageId !=
                                  null) {
                                context.pushRoute(PnrrDetailRoute(
                                    type: 'servizio'
                                        '',
                                    id: state.servicesList[index].sitePageId!));
                              } else {
                                context.pushRoute(OnlineServiceDetailWebviewRoute(
                                    name: '',
                                    url: state.servicesList[index].url ?? ''));
                              }
                            },
                            child: Card(
                              color: Theme.of(context).cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.servicesList[index].title ??
                                                  '',
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              state.servicesList[index]
                                                      .shortDescription ??
                                                  '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_outlined))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else if (state is FetchingPnrrServiceState) {
              return ShimmerUtils.buildShimmer(6);
            } else {
              return Text('error');
            }
          },
        ));
  }
}
