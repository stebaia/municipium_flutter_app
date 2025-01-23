import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/garbage_blocs/recycling_areas_bloc/recycling_areas_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:provider/provider.dart';

@RoutePage()
class GarbageReciclingAreasPage extends StatefulWidget
    implements AutoRouteWrapper {
  const GarbageReciclingAreasPage({super.key});

  @override
  State<GarbageReciclingAreasPage> createState() =>
      _GarbageReciclingAreasPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => RecyclingAreasBloc(repository: context.read())
              ..fetchRecyclingAreas(
                  Provider.of<BaseUrlNotifier>(context, listen: false)
                      .baseUrl)),
      ], child: this);
}

class _GarbageReciclingAreasPageState extends State<GarbageReciclingAreasPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                context.read<RecyclingAreasBloc>().isSearching =
                    !context.read<RecyclingAreasBloc>().isSearching;
                if (!context.read<RecyclingAreasBloc>().isSearching) {
                  // Clear search when closing the search
                  //_searchController.clear();
                  //context.read<PointOfInterestBloc>().filterNewsList('');
                }
              });
            },
          ),
        ],
        title: context.read<RecyclingAreasBloc>().isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Cerca...",
                  border: InputBorder.none,
                ),
                onChanged: ((value) => context
                    .read<RecyclingAreasBloc>()
                    .filterRecyclingAreas(value)),
              )
            : Text(
                AppLocalizations.of(context)!
                    .text_garbage_recycling_areas_title
                    .toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
      ),
      body: BlocBuilder<RecyclingAreasBloc, RecyclingAreasState>(
        builder: (context, state) {
          if (state is FetchedRecyclingAreasState) {
            return ListView.builder(
                itemCount: state.recyclingAreas.length,
                itemBuilder: ((context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        onTap: () => context.pushRoute(DetailPoiRoute(
                            poiId: state.recyclingAreas[index].id!)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: Theme.of(context).canvasColor,
                        title: Text(state.recyclingAreas[index].name!,
                            style: Theme.of(context).textTheme.titleMedium),
                        subtitle: Text(state.recyclingAreas[index].address!,
                            style: Theme.of(context).textTheme.bodySmall),
                        trailing: const Icon(CupertinoIcons.chevron_right),
                      ),
                    )));
          } else if (state is FetchingRecyclingAreasState) {
            return ShimmerUtils.buildPoiShimmer(6, context);
          } else {
            return Center(
              child:
                  Text(AppLocalizations.of(context)!.text_no_recycling_in_list),
            );
          }
        },
      ),
    );
  }
}
