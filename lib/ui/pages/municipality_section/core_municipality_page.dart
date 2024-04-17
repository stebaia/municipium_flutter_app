import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/menu_drawer.dart';

@RoutePage()
class CoreMunicipalityPage extends StatelessWidget {
  CoreMunicipalityPage({super.key});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      scaffoldKey: _scaffoldKey,
      backgroundColor: Colors.white,
      //darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
      routes: const [HomeRoute(), HomeRoute(), HomeRoute(), HomeRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                activeIcon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map),
                activeIcon: Icon(CupertinoIcons.map),
                label: 'Mappa',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.calendar),
                activeIcon: Icon(CupertinoIcons.calendar),
                label: 'Agenda',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                activeIcon: Icon(CupertinoIcons.person),
                label: 'Area personale',
              ),
            ]);
      },
      drawer: MenuDrawer(),
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
