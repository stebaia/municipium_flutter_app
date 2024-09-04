import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.text_calendar_title.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            leading: GestureDetector(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: const Icon(Icons.menu),
            )),
        body: Column(
          children: [
            TableCalendar(
              headerStyle: const HeaderStyle(
                titleCentered: true
              ),
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            )
          ],
        ));
  }
}
