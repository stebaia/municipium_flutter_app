import 'package:auto_route/auto_route.dart';
import 'package:municipium/routers/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route', )
class AppRouter extends $AppRouter {

 @override
 List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: OnboardingSearchMunicipalityRoute.page),
    AutoRoute(
      page: MainRoute.page,
    ),
    AutoRoute(
      page: NewsListRoute.page,
    ),
    AutoRoute(
      page: NewsDetailRoute.page
    ),
    AutoRoute(
      page: PointOfInterestListRoute.page
    )
 ];
}