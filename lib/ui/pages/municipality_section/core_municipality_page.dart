import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/calendar_event_bloc/calendar_event_bloc_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/temporary_menu_conf_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/user_menu_conf_cubit_cubit.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/services/auth/service_manager.dart';
import 'package:municipium/ui/components/bottom_sheet/custom_bottomsheet.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:municipium/ui/components/municipality_components/modal_rapid_action_component.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';

@RoutePage()
class CoreMunicipalityPage extends StatefulWidget {
  final int municipalityId;
  CoreMunicipalityPage({super.key, required this.municipalityId});

  @override
  State<CoreMunicipalityPage> createState() => _CoreMunicipalityPageState();
}

class _CoreMunicipalityPageState extends State<CoreMunicipalityPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<UserMenuConfigurationCubit>().initialize();
    context.read<TemporaryConfigurationCubit>().initialize();
    final municipality = (context.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;

    return AutoTabsRouter(
        routes: [
          HomeRoute(scaffoldKey: scaffoldKey),
          MapsRoute(scaffoldKey: scaffoldKey),
          CalendarRoute(scaffoldKey: scaffoldKey),
          if (municipality.configurations != null)
            PersonalAreaMenuRoute(scaffoldKey: scaffoldKey),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
              opacity: animation,
              // the passed child is technically our animated selected-tab page
              child: child,
            ),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
              key: scaffoldKey,
              body: child,
              drawer: MenuDrawer(
                mContext: context,
                scaffoldKey: scaffoldKey,
              ),
              //darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
              floatingActionButton: tabsRouter.activeIndex == 0
                  ? FloatingActionButton.extended(
                      onPressed: (() =>
                          context.pushRoute(const UserConfMenuEditRoute())),
                      label: Text(
                        'Personalizza',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.edit, color: Colors.white),
                    )
                  : FloatingActionButton(
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: ((modalContext) => CustomBaseBottomSheet(
                              height: MediaQuery.of(context).size.height * 0.3,
                              title: 'azioni rapide',
                              body: const ModalRapidActionComponent()))),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
              bottomNavigationBar: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: ThemeHelper.blueMunicipium,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (index) async {
                    // here we switch between tabs
                    if (index == 2) {
                      context.read<CalendarBloc>().fetchCalendarEvents(
                            date: MunicipiumUtility.getFirstDayOfMonth(),
                            endDate: MunicipiumUtility.getLastDayOfMonth());
                    }
                    if (index == 3) {
                      bool isEnabled = await context
                          .read<ServiceAccessManager>()
                          .handleServiceAccess('Area Personale', context);
                      if (isEnabled) {
                        tabsRouter.setActiveIndex(index);
                      }
                    } else {
                      tabsRouter.setActiveIndex(index);
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: const SizedBox(
                          height: 30,
                          child: Icon(
                            CupertinoIcons.home,
                            color: Colors.white,
                          )),
                      activeIcon: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: 50,
                          height: 30,
                          child: const Icon(
                            CupertinoIcons.home,
                            color: ThemeHelper.blueMunicipium,
                          )),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: const SizedBox(
                          height: 30,
                          child: Icon(
                            CupertinoIcons.map,
                            color: Colors.white,
                          )),
                      activeIcon: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: 50,
                          height: 30,
                          child: const Icon(
                            CupertinoIcons.map,
                            color: ThemeHelper.blueMunicipium,
                          )),
                      label: 'Mappa',
                    ),
                    BottomNavigationBarItem(
                      icon: const SizedBox(
                          height: 30,
                          child: Icon(
                            CupertinoIcons.calendar,
                            color: Colors.white,
                          )),
                      activeIcon: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: 50,
                          height: 30,
                          child: const Icon(
                            CupertinoIcons.calendar,
                            color: ThemeHelper.blueMunicipium,
                          )),
                      label: 'Agenda',
                    ),
                    if (municipality.configurations != null)
                      if (municipality.configurations!.autenticazioneSpid! ||
                          municipality.configurations!.autenticazioneCie!)
                        BottomNavigationBarItem(
                          icon: const SizedBox(
                              height: 30,
                              child: Icon(
                                CupertinoIcons.person,
                                color: Colors.white,
                              )),
                          activeIcon: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              width: 50,
                              height: 30,
                              child: const Icon(
                                CupertinoIcons.person,
                                color: ThemeHelper.blueMunicipium,
                              )),
                          label: 'Area personale',
                        ),
                  ]));
        });
  }
}
