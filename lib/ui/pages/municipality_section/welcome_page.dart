import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:municipium/bloc/bloc/calendar_event_bloc/calendar_event_bloc_bloc.dart';
import 'package:municipium/bloc/bloc/civil_defence_bloc/emergency_call/emergency_call_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_url_cubit.dart/municipality_url_cubit.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:municipium/ui/components/civil_defence/civil_defence_emergency_phone_number_component.dart';
import 'package:municipium/ui/components/bottom_sheet/custom_bottomsheet.dart';
import 'package:municipium/ui/components/municipality_components/emergency_call_box.dart';
import 'package:municipium/ui/components/municipality_components/info_municipality_box.dart';
import 'package:municipium/ui/components/municipality_components/last_update_box.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:intl/intl.dart';

@RoutePage()
class WelcomePage extends StatefulWidget implements AutoRouteWrapper {
  const WelcomePage({super.key, required this.municipalityId});
  final int municipalityId;
  @override
  State<WelcomePage> createState() => _WelcomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    
    DateTime today = DateTime.now();
    DateTime tomorrow = DateTime(today.year, today.month, today.day + 1);

    return MultiBlocProvider(providers: [
      BlocProvider<MunicipalityBloc>(
        create: (context) =>
            MunicipalityBloc(municipalityRepository: context.read())
              ..fetchMunicipality(municipalityId),
      ),
      BlocProvider<EmergencyCallBloc>(
        create: (context) =>
            EmergencyCallBloc(civilDefenceRepository: context.read())
              ..fetchEmergencyCallList(),
      ),
      BlocProvider<CalendarBloc>(
        create: (context) =>
            CalendarBloc(calendarEventRepository: context.read())
              ..fetchCalendarEvents(date: DateFormat('yyyy-MM-dd').format(today), endDate:  DateFormat('yyyy-MM-dd').format(tomorrow)),
      )
    ], child: this);
  }
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocConsumer<MunicipalityBloc, MunicipalityState>(
            listener: (context, state) {
          if (state is ErrorMunicipalityState) {
            context.pushRoute(const OnboardingRoute());
          }
        }, builder: ((context, state) {
          if (state is FetchingMunicipalityState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchedMunicipalityState) {
            Municipality municipality = state.municipality;
            context.read<MunicipalityUrlCubit>().fetchMunicipalityInStorage();
            context.read<MunicipalityGlobalCubit>().authenticated(municipality);
            return Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.network(
                      '${municipality.background.baseUrl}${municipality.background.i1280}',
                      fit: BoxFit.cover,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Container(
                      decoration: BoxDecoration(                     
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          InfoMunicipalityBox(municipality: municipality),
                          
                          const SizedBox(
                            height: 10,
                          ),
                          const LastUpdateBox(),
                          const SizedBox(
                            height: 10,
                          ),
                          FullWidthConfirmButton(
                            fillColor: ThemeHelper.blueMunicipium,
                            isEnabled: true,
                            onTap: () {
                              context.replaceRoute(CoreMunicipalityRoute(
                                  municipalityId: widget.municipalityId));
                            },
                            text: AppLocalizations.of(context)!
                                .btn_go_to_municipium,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)!.error_get_municipality),
            );
          }
        })),
      ),
    );
  }
}
