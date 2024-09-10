import 'package:auto_route/auto_route.dart';
import 'package:municipium/routers/app_router.gr.dart';

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
          AutoRoute(page: PersonalAreaMenuRoute.page),
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
        AutoRoute(
          page: AccountDataRoute.page,
        ),
        AutoRoute(
          page: AccountPrefereceRoute.page,
        ),
        AutoRoute(page: WebViewSpidAuthRoute.page),
        AutoRoute(page: ServiceOnlineListRoute.page),
        AutoRoute(page: LoginSpidIdpListRoute.page),
        AutoRoute(page: ChooseMunicipalityRoute.page),
        AutoRoute(page: PnrrServicesRoute.page),
        AutoRoute(page: PnrrDetailRoute.page),
        AutoRoute(page: OnlineServiceDetailWebviewRoute.page),
        AutoRoute(page: EventDetailRoute.page),
        AutoRoute(page: DetailPoiRoute.page),
        AutoRoute(page: IssuesListRoute.page),
        AutoRoute(page: NewIssueRouter.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: NewsDetailRoute.page),
        AutoRoute(page: PointOfInterestListRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: UserConfMenuEditRoute.page),
        AutoRoute(page: IssueDetailRoute.page),
        AutoRoute(page: NewissueCompletedRoute.page),
        AutoRoute(page: ChatMessageRoute.page),
        AutoRoute(page: PaymentChoiceRoute.page),
        AutoRoute(page: SelfPaymentsRoute.page),
        AutoRoute(page: NewSelfPaymentRouter.page),
        AutoRoute(page: PersonTypePaymentRoute.page)
      ];
}
