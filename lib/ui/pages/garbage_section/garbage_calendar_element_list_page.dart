import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/bloc/garbage_blocs/garbage_calendar_element_list_bloc/garbage_calendar_element_list_bloc.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class GarbageCalendarElementListPage extends StatefulWidget
    implements AutoRouteWrapper {
  const GarbageCalendarElementListPage({super.key});

  @override
  State<GarbageCalendarElementListPage> createState() =>
      _GarbageCalendarElementListPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              GarbageCategoriesBloc(garbageCalendarsRepository: context.read())
                ..fetchGarbageCategories(
                  Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl,
                ),
        )
      ], child: this);
}

class _GarbageCalendarElementListPageState
    extends State<GarbageCalendarElementListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  context.read<GarbageCategoriesBloc>().isSearching
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
                      context.read<GarbageCategoriesBloc>().filterGarbageCategories(value)),
                )
              :  Text(
          AppLocalizations.of(context)!.garbage_categories_menu.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                context.read<GarbageCategoriesBloc>().isSearching =
                    !context.read<GarbageCategoriesBloc>().isSearching;
                if (!context.read<GarbageCategoriesBloc>().isSearching) {
                  // Clear search when closing the search
                  _searchController.clear();
                  context
                      .read<GarbageCategoriesBloc>()
                      .filterGarbageCategories('');
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<GarbageCategoriesBloc, GarbageCategoriesState>(
            builder: (context, state) {
              if (state is FetchedGarbageCategoriesState) {
                List<WrappedGarbageCalendars> garbageList =
                    state.garbageCategoriesList;
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                  shrinkWrap: true,
                  itemCount: garbageList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(garbageList[index].garbageCalendars.name),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.pushRoute(GarbageElementDetailRoute(
                            id: garbageList[index].parentId));
                      },
                    );
                  },
                );
              } else if (state is FetchingGarbageCategoriesState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
