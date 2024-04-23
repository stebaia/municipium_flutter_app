import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/menu_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            items: [
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home),
                activeIcon: const Icon(CupertinoIcons.home),
                label: AppLocalizations.of(context)!.navbar_home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.map),
                activeIcon: const Icon(CupertinoIcons.map),
                label: AppLocalizations.of(context)!.navbar_maps,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.calendar),
                activeIcon: const Icon(CupertinoIcons.calendar),
                label: AppLocalizations.of(context)!.navbar_calendar,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person),
                activeIcon: const Icon(CupertinoIcons.person),
                label: AppLocalizations.of(context)!.navbar_personal_area,
              ),
            ]);
      },
      drawer: MenuDrawer(
        mContext: context,
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
