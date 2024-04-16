import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/routers/app_router.gr.dart';



@RoutePage()
class CoreMunicipalityPage extends StatelessWidget {
  const CoreMunicipalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        backgroundColor: Colors.white,
        //darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
        routes: [
          HomeRoute()
        ],
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
      );
  }
  
}


