import 'package:auto_route/auto_route.dart';
import 'package:municipium/ui/pages/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: false,
  routes: [
    AutoRoute(page: MainPage, initial: true),
  ],
)
class $AppRouter {}