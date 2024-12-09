import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:municipium/bloc/bloc/garbage_blocs/garbage_calendar_element_list_bloc/garbage_calendar_element_list_bloc.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/model/garbage/garbage_calendar_element.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class GarbageCalendarElementListPage extends StatelessWidget
    implements AutoRouteWrapper {
  const GarbageCalendarElementListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!
                .text_garbage_calendar_title
                .toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BlocBuilder<GarbageCategoriesBloc, GarbageCategoriesState>(
                builder: (context, state) {
                  if (state is FetchedGarbageCategoriesState) {
                    List<GarbageCalendars> garbageList =
                        state.garbageCategoriesList;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: garbageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(garbageList[index].name),
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
        ));
  }

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
