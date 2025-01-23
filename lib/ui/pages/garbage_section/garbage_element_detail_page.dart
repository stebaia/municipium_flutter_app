import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/bloc/garbage_blocs/garbage_calendar_element_bloc/garbage_calendar_element_bloc.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class GarbageElementDetailPage extends StatelessWidget
    implements AutoRouteWrapper {
  const GarbageElementDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!
              .text_garbage_detail_calendar_element_title.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body:
          BlocBuilder<GarbageCalendarElementBloc, GarbageCalendarElementState>(
        builder: (context, state) {
          if (state is FetchingGarbageCalendarElementState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchedGarbageCalendarElementState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      state.garbageCalendarElement.imageGreen.baseUrl != null
                          ? Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(4),
                              child: Image.network(state.garbageCalendarElement
                                      .imageGreen.baseUrl! +
                                  state
                                      .garbageCalendarElement.imageGreen.i640!))
                          : const SizedBox(width: 50, height: 50),
                        const SizedBox(width: 8,),
                      Text(
                        state.garbageCalendarElement.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Divider(color: Theme.of(context).disabledColor,),
                  const SizedBox(height: 8,),
                  Text(AppLocalizations.of(context)!.label_text_description, style: Theme.of(context).textTheme.titleMedium,),
                  const SizedBox(height: 8,),
                  Html(data: state.garbageCalendarElement.description,),
                  const SizedBox(height: 8,),
                  Divider(color: Theme.of(context).disabledColor,),
                  const SizedBox(height: 8,),
                  Text(AppLocalizations.of(context)!.label_text_instruction, style: Theme.of(context).textTheme.titleMedium,),
                  const SizedBox(height: 8,),
                  Html(data: state.garbageCalendarElement.instructions,),
                  const SizedBox(height: 8,),
                  Divider(color: Theme.of(context).disabledColor,),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => GarbageCalendarElementBloc(
              garbageCalendarsRepository: context.read())..fetchGarbageCalendarElement(Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl, id),
        ),
      ], child: this);
}
