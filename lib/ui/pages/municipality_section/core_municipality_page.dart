import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/app.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/main.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/custom_bottomsheet.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:municipium/ui/components/municipality_components/modal_rapid_action_component.dart';
import 'package:municipium/utils/theme_helper.dart';



@RoutePage()
class CoreMunicipalityPage extends StatelessWidget implements AutoRouteWrapper {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CoreMunicipalityPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      scaffoldKey: scaffoldKey,
      
        drawer: MenuDrawer(
          mContext: context,
          scaffoldKey: scaffoldKey,
        ),
      //darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
      routes: [HomeRoute(), MapsRoute(scaffoldKey: scaffoldKey), HomeRoute(), HomeRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            elevation: 0,
            backgroundColor: ThemeHelper.blueMunicipium,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 50,
                    height: 30,
                    child: const Icon(
                      CupertinoIcons.calendar,
                      color: ThemeHelper.blueMunicipium,
                    )),
                label: 'Agenda',
              ),
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 50,
                    height: 30,
                    child: const Icon(
                      CupertinoIcons.person,
                      color: ThemeHelper.blueMunicipium,
                    )),
                label: 'Area personale',
              ),
            ]);
      },
      
      floatingActionButton: FloatingActionButton(
        onPressed: (() => showModalBottomSheet(
            context: context,
            builder: ((modalContext) => CustomBaseBottomSheet(
                height: MediaQuery.of(context).size.height * 0.3,
                title: 'azioni rapide',
                body: const ModalRapidActionComponent())))),
        child: const Icon(Icons.add),
      ),
      
     
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<MunicipalityBloc>(
          create: (context) =>
              MunicipalityBloc(municipalityRepository: context.read())
                ..fetchMunicipality(8093),
        ),
      ], child: this);
}
