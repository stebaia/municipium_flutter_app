import 'package:auto_route/auto_route.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: OnboardingSearchMunicipalityRoute.page),
        AutoRoute(page: CoreMunicipalityRoute.page, children: [
          AutoRoute(page: HomeRoute.page),
           AutoRoute(page: MapsRoute.page),
        ]),
        AutoRoute(page: SubMenuRoute.page),
        AutoRoute(
          page: MainRoute.page,
        ),
        AutoRoute(
          page: NewsListRoute.page,
        ),
        AutoRoute(
          page: EventListRoute.page,
        ),
        AutoRoute(page: EventDetailRoute.page),
        AutoRoute(page: DetailPoiRoute.page),
        AutoRoute(page: IssuesListRoute.page),
        AutoRoute(page: NewIssueRouter.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: NewsDetailRoute.page),
        AutoRoute(page: PointOfInterestListRoute.page)
      ];
}
