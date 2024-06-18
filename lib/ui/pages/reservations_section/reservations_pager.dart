import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/reservations_unit_bloc/reservations_unit_bloc.dart';
import 'package:municipium/ui/components/pager/progress_pager_stepper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ReservationsPager extends StatelessWidget implements AutoRouteWrapper {
  const ReservationsPager({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final municipality = (context.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return MultiBlocProvider(providers: [
      BlocProvider<ReservationsUnitBloc>(
        create: (context) =>
            ReservationsUnitBloc(reservationsRepository: context.read())
              ..fetchReservationUnits(municipality.muninicipalityId),
      ),
    ], child: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Rimuovi il titolo
        title: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.maybePop();
              // Azione da eseguire quando il pulsante viene premuto
              // go to next page
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  getTitle(context, 0),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox()
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ProgressPagerStepper(totalPage: 5, currentPage: 0)
          ],
        ),
      ),
    );
  }

  String getTitle(BuildContext context, int currentPage) {
    switch (currentPage) {
      case 0:
        return AppLocalizations.of(context)!.issue_type;
      case 1:
        return AppLocalizations.of(context)!.issue_data;
      case 2:
        return AppLocalizations.of(context)!.issue_photo;
      case 3:
        return AppLocalizations.of(context)!.issue_recap;
      default:
        return '';
    }
  }
}
