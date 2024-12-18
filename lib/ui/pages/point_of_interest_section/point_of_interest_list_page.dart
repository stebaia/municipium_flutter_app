import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/model/point_of_interests_item.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class PointOfInterestListPage extends StatefulWidget
    implements AutoRouteWrapper {
  const PointOfInterestListPage({super.key});

  @override
  State<PointOfInterestListPage> createState() =>
      _PointOfInterestListPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PointOfInterestBloc>(
          create: (context) => PointOfInterestBloc(
              pointOfInterestRepository: context.read())
            ..fetchPagedPointOfInterestList(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
        )
      ], child: this);
}

class _PointOfInterestListPageState extends State<PointOfInterestListPage> {
  final List<PointOfInterestsItem> _pointOfInterestItemList = [];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.poi_menu.toUpperCase(),
            style: const TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  context.read<PointOfInterestBloc>().isSearching =
                      !context.read<PointOfInterestBloc>().isSearching;
                  if (!context.read<PointOfInterestBloc>().isSearching) {
                    // Clear search when closing the search
                    //_searchController.clear();
                    //context.read<PointOfInterestBloc>().filterNewsList('');
                  }
                });
              },
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            child: BlocBuilder<PointOfInterestBloc, PointOfInterestState>(
          builder: (context, state) {
            if (state is FetchingPointOfInterestListState &&
                _pointOfInterestItemList.isEmpty) {
              return ShimmerUtils.buildPoiShimmer(6);
            } else if (state is FetchedPointOfInterestListState) {
              _pointOfInterestItemList.addAll(state
                  .pointOfInterestsList.pointOfInterestsItemList!
                  .toList());
              context.read<PointOfInterestBloc>().isFetching = false;
            } else if (state is NoPointOfInterestListState &&
                _pointOfInterestItemList.isEmpty) {
              return Center(
                child: Text(
                    AppLocalizations.of(context)!.text_no_recycling_in_list),
              );
            } else if (state is ErrorPointOfInterestListState) {
              return const Center(
                child: Text('Errore nel download deli poi'),
              );
            }
            return ListView.builder(
                controller: _scrollController
                  ..addListener(() {
                    if (_scrollController.offset ==
                            _scrollController.position.maxScrollExtent &&
                        !context.read<PointOfInterestBloc>().isFetching) {
                      context.read<PointOfInterestBloc>()
                        ..isFetching = true
                        ..add(FetchPagedPointOfInterestListEvent(
                            Provider.of<BaseUrlNotifier>(context, listen: false)
                                .baseUrl));
                    }
                  }),
                itemCount: _pointOfInterestItemList.length,
                itemBuilder: ((context, index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        onTap: () => context.pushRoute(DetailPoiRoute(
                            poiId: _pointOfInterestItemList[index].id!)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: Theme.of(context).canvasColor,
                        title: Text(_pointOfInterestItemList[index].name!, style: Theme.of(context).textTheme.titleMedium),
                        subtitle:
                            Text(_pointOfInterestItemList[index].address!, style: Theme.of(context).textTheme.bodySmall),
                        trailing: Icon(CupertinoIcons.chevron_right),
                      ),
                    )));
          },
        )));
  }
}
