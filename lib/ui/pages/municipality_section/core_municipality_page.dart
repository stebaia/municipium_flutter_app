import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/custom_bottomsheet.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:municipium/ui/components/municipality_components/modal_rapid_action_component.dart';
import 'package:municipium/utils/theme_helper.dart';

@RoutePage()
class CoreMunicipalityPage extends StatelessWidget {
  CoreMunicipalityPage({super.key});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      drawer: MenuDrawer(
        mContext: context,
        scaffoldKey: _scaffoldKey,
      ),
      scaffoldKey: _scaffoldKey,
      backgroundColor: Colors.white,
      //darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
      routes: const [HomeRoute(), HomeRoute(), HomeRoute(), HomeRoute()],
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
      appBarBuilder: ((context, tabsRouter) {
        return AppBar(
          title: Text(tabsRouter.current.name),
          backgroundColor: Colors.transparent,
          leading: null,
          actions: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        );
      }),
    );
  }
}
