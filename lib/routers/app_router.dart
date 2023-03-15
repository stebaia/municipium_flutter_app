import 'package:auto_route/auto_route.dart';
import 'package:municipium/ui/pages/main_page.dart';
import 'package:municipium/ui/pages/news_section/news_detail_page.dart';
import 'package:municipium/ui/pages/news_section/news_list_page.dart';
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart';
import 'package:municipium/ui/pages/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: false,
  routes: [
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(
      page: MainPage,
    ),
    AutoRoute(
      page: NewsListPage,
    ),
    AutoRoute(
      page: NewsDetailPage
    ),
    AutoRoute(
      page: PointOfInterestListPage
    )
  ],
)
class $AppRouter {}
