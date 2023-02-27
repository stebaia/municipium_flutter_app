import 'package:auto_route/auto_route.dart';
import 'package:municipium/ui/pages/main_page.dart';
import 'package:municipium/ui/pages/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: false,
  routes: [
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(
      page: MainPage,
    ),
  ],
)
class $AppRouter {}
