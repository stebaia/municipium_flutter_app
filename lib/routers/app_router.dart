import 'package:auto_route/auto_route.dart';
import 'package:municipium/routers/app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: OnboardingSearchMunicipalityRoute.page),
        AutoRoute(page: CoreMunicipalityRoute.page, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: MapsRoute.page),
          AutoRoute(page: CalendarRoute.page),
          AutoRoute(page: PersonalAreaMenuRoute.page),
        ]),
        AutoRoute(page: SubMenuRoute.page),
        AutoRoute(
          page: MainRoute.page,
        ),
        AutoRoute(page: NewsListRoute.page, path: '/news'),
        AutoRoute(page: EventListRoute.page, path: '/events'),
        AutoRoute(
          page: AccountDataRoute.page,
        ),
        AutoRoute(
          page: AccountPrefereceRoute.page,
        ),
        AutoRoute(page: WebViewSpidAuthRoute.page),
        AutoRoute(page: ServiceOnlineListRoute.page, path: '/services'),
        AutoRoute(page: LoginSpidIdpListRoute.page),
        AutoRoute(page: ChooseMunicipalityRoute.page),
        AutoRoute(page: PnrrServicesRoute.page),
        AutoRoute(page: PnrrDetailRoute.page),
        AutoRoute(page: OnlineServiceDetailWebviewRoute.page),
        AutoRoute(page: EventDetailRoute.page),
        AutoRoute(page: DetailPoiRoute.page),
        AutoRoute(page: IssuesListRoute.page, path: '/issue'),
        AutoRoute(page: NewIssueRouter.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: NewsDetailRoute.page),
        AutoRoute(page: PointOfInterestListRoute.page, path: '/poi'),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: UserConfMenuEditRoute.page),
        AutoRoute(page: IssueDetailRoute.page),
        AutoRoute(page: NewissueCompletedRoute.page),
        AutoRoute(page: ChatMessageRoute.page),
        AutoRoute(page: PaymentChoiceRoute.page),
        AutoRoute(page: SelfPaymentsRoute.page),
        AutoRoute(page: NewSelfPaymentRouter.page),
        AutoRoute(page: PersonTypePaymentRoute.page),
        AutoRoute(page: WeatherQualityRoute.page),
        AutoRoute(page: CivilDefenceAreYouReadyDetailRoute.page),
        AutoRoute(
            page: CivilDefenceNumbersRoute.page,
            path: '/civil_defence_phone_numbers'),
        AutoRoute(
            page: CivilDefenceNewsRoute.page,
            path: '/civil_defence_alerts_news'),
        AutoRoute(
            page: CivilDefenceInformationsRoute.page,
            path: '/civil_defence_informations'),
        AutoRoute(
            page: CivilDefenceAreYouReadyRoute.page,
            path: '/civil_defence_are_you_ready'),
        AutoRoute(
            page: CivilDefenceLevelRoute.page, path: '/civil_defence_levels'),
        AutoRoute(page: PrenotationRoute.page, path: '/prenotazioni'),
        AutoRoute(page: GarbageCalendarRoute.page, path: '/calendars'),
        AutoRoute(
          page: GarbageCalendarDetailRoute.page,
        ),
        AutoRoute(
          page: GarbageElementDetailRoute.page,
        ),
        AutoRoute(
            page: GarbageCalendarElementListRoute.page,
            path: '/garbage_categories'),
        AutoRoute(
          page: LissiDashboardRoute.page,
        ),
        AutoRoute(
          page: LissiPresentationTemplateListRoute.page,
        ),
        AutoRoute(
          page: LissiPresentationSessionRoute.page,
        ),
        AutoRoute(
          page: GarbageReciclingAreasRoute.page,
        path: '/recycling_areas'),

        AutoRoute(
          page: GarbageInfoRetirementRoute.page,
        path: '/garbage_collections'),
        
        AutoRoute(
          page: SurveryListRoute.page,
        path: '/surveys'),
      AutoRoute(
          page: SurveyDetailRoute.page,
        path: '/surveys/:id'),
      ];
}
