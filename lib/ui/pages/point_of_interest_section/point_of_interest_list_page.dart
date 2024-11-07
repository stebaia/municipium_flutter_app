import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/model/point_of_interests_item.dart';
import 'package:municipium/utils/base_url_notifier.dart';
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
            ..fetchPointOfInterestList(
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
        )),
        extendBodyBehindAppBar: true,
        body: Container(
            child: BlocBuilder<PointOfInterestBloc, PointOfInterestState>(
          builder: (context, state) {
            if (state is FetchingPointOfInterestListState &&
                _pointOfInterestItemList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchedPointOfInterestListState) {
              _pointOfInterestItemList.addAll(state
                  .pointOfInterestsList.pointOfInterestsItemList!
                  .toList());
              context.read<PointOfInterestBloc>().isFetching = false;
            } else if (state is NoPointOfInterestListState &&
                _pointOfInterestItemList.isEmpty) {
              return Center(
                child: Text('Nessun poi presente'),
              );
            } else if (state is ErrorPointOfInterestListState) {
              return Center(
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
                        ..add(FetchPointOfInterestListEvent(
                            Provider.of<BaseUrlNotifier>(context, listen: false)
                                .baseUrl));
                    }
                  }),
                itemCount: _pointOfInterestItemList.length,
                itemBuilder: ((context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    tileColor: Theme.of(context).canvasColor,
                    title: Text(_pointOfInterestItemList[index].name!),
                    subtitle: Text(_pointOfInterestItemList[index].address!),
                    trailing: Icon(CupertinoIcons.chevron_right),
                  ),
                )));
          },
        )));
  }
}
