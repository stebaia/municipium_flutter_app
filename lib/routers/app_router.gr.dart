// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/cupertino.dart' as _i35;
import 'package:flutter/material.dart' as _i33;
import 'package:municipium/model/menu/menu_item.dart' as _i37;
import 'package:municipium/model/menu/submenu_type.dart' as _i36;
import 'package:municipium/model/user/user_spid_model.dart' as _i34;
import 'package:municipium/ui/pages/events_section/event_detail_page.dart'
    as _i6;
import 'package:municipium/ui/pages/events_section/event_list_page.dart' as _i7;
import 'package:municipium/ui/pages/issues_section/issues_list_page.dart'
    as _i9;
import 'package:municipium/ui/pages/issues_section/new_issue_pager.dart'
    as _i14;
import 'package:municipium/ui/pages/main_page.dart' as _i11;
import 'package:municipium/ui/pages/municipality_section/choose_municipality_page.dart'
    as _i3;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i4;
import 'package:municipium/ui/pages/municipality_section/home_page.dart' as _i8;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i31;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i15;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i16;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i17;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i18;
import 'package:municipium/ui/pages/online_service_detail_webview.dart' as _i19;
import 'package:municipium/ui/pages/personal_area_section/account_data_page.dart'
    as _i1;
import 'package:municipium/ui/pages/personal_area_section/account_preferece_page.dart'
    as _i2;
import 'package:municipium/ui/pages/personal_area_section/confirm_auth_spid_page.dart'
    as _i13;
import 'package:municipium/ui/pages/personal_area_section/login_spid_idp_list_page.dart'
    as _i10;
import 'package:municipium/ui/pages/personal_area_section/personal_area_menu_page.dart'
    as _i20;
import 'package:municipium/ui/pages/personal_area_section/webview_spid_auth_page.dart'
    as _i30;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_page.dart'
    as _i21;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_services_page.dart'
    as _i22;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i23;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i5;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i12;
import 'package:municipium/ui/pages/reservations_section/reservations_pager.dart'
    as _i24;
import 'package:municipium/ui/pages/service_online_section/service_online_list_page.dart'
    as _i25;
import 'package:municipium/ui/pages/settings_section/settings_page.dart'
    as _i26;
import 'package:municipium/ui/pages/splash_page.dart' as _i27;
import 'package:municipium/ui/pages/submenu_page.dart' as _i28;
import 'package:municipium/ui/pages/user_configuration_section/user_conf_menu_edit_page.dart'
    as _i29;

abstract class $AppRouter extends _i32.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    AccountDataRoute.name: (routeData) {
      final args = routeData.argsAs<AccountDataRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AccountDataPage(
          key: args.key,
          userModel: args.userModel,
        ),
      );
    },
    AccountPrefereceRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AccountPreferecePage(),
      );
    },
    ChooseMunicipalityRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i3.ChooseMunicipalityPage()),
      );
    },
    CoreMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<CoreMunicipalityRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CoreMunicipalityPage(
          key: args.key,
          municipalityId: args.municipalityId,
        ),
      );
    },
    DetailPoiRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPoiRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i5.DetailPoiPage(
          key: args.key,
          poiId: args.poiId,
        )),
      );
    },
    EventDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i6.EventDetailPage(
          key: args.key,
          eventId: args.eventId,
        )),
      );
    },
    EventListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i7.EventListPage()),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HomePage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    IssuesListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i9.IssuesListPage()),
      );
    },
    LoginSpidIdpListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i10.LoginSpidIdpListPage()),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i11.MainPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    MapsRoute.name: (routeData) {
      final args = routeData.argsAs<MapsRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i12.MapsPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        )),
      );
    },
    MyWidget.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MyWidget(),
      );
    },
    NewIssueRouter.name: (routeData) {
      final args = routeData.argsAs<NewIssueRouterArgs>(
          orElse: () => const NewIssueRouterArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: _i14.NewIssuePager(key: args.key)),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i15.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i16.NewsListPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.OnboardingPage(),
      );
    },
    OnboardingSearchMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i18.OnboardingSearchMunicipalityPage(key: args.key)),
      );
    },
    OnlineServiceDetailWebviewRoute.name: (routeData) {
      final args = routeData.argsAs<OnlineServiceDetailWebviewRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.OnlineServiceDetailWebviewPage(
          key: args.key,
          url: args.url,
          name: args.name,
        ),
      );
    },
    PersonalAreaMenuRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalAreaMenuRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.PersonalAreaMenuPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    PnrrDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i21.PnrrDetailPage(
          key: args.key,
          type: args.type,
          id: args.id,
        )),
      );
    },
    PnrrServicesRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrServicesRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i22.PnrrServicesPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i23.PointOfInterestListPage()),
      );
    },
    ReservationsRouter.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i24.ReservationsPager()),
      );
    },
    ServiceOnlineListRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceOnlineListRouteArgs>(
          orElse: () => const ServiceOnlineListRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i32.WrappedRoute(child: _i25.ServiceOnlineListPage(key: args.key)),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SplashPage(),
      );
    },
    SubMenuRoute.name: (routeData) {
      final args = routeData.argsAs<SubMenuRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.SubMenuPage(
          key: args.key,
          menu: args.menu,
          item: args.item,
        ),
      );
    },
    UserConfMenuEditRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.UserConfMenuEditPage(),
      );
    },
    WebViewSpidAuthRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewSpidAuthRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i30.WebViewSpidAuthPage(
          key: args.key,
          urlSpid: args.urlSpid,
          municipalityId: args.municipalityId,
          authSystem: args.authSystem,
        )),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i31.WelcomePage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountDataPage]
class AccountDataRoute extends _i32.PageRouteInfo<AccountDataRouteArgs> {
  AccountDataRoute({
    _i33.Key? key,
    required _i34.SpidUserModel userModel,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          AccountDataRoute.name,
          args: AccountDataRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountDataRoute';

  static const _i32.PageInfo<AccountDataRouteArgs> page =
      _i32.PageInfo<AccountDataRouteArgs>(name);
}

class AccountDataRouteArgs {
  const AccountDataRouteArgs({
    this.key,
    required this.userModel,
  });

  final _i33.Key? key;

  final _i34.SpidUserModel userModel;

  @override
  String toString() {
    return 'AccountDataRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [_i2.AccountPreferecePage]
class AccountPrefereceRoute extends _i32.PageRouteInfo<void> {
  const AccountPrefereceRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AccountPrefereceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountPrefereceRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChooseMunicipalityPage]
class ChooseMunicipalityRoute extends _i32.PageRouteInfo<void> {
  const ChooseMunicipalityRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ChooseMunicipalityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseMunicipalityRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CoreMunicipalityPage]
class CoreMunicipalityRoute
    extends _i32.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i35.Key? key,
    required int municipalityId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static const _i32.PageInfo<CoreMunicipalityRouteArgs> page =
      _i32.PageInfo<CoreMunicipalityRouteArgs>(name);
}

class CoreMunicipalityRouteArgs {
  const CoreMunicipalityRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i35.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i5.DetailPoiPage]
class DetailPoiRoute extends _i32.PageRouteInfo<DetailPoiRouteArgs> {
  DetailPoiRoute({
    _i35.Key? key,
    required int poiId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          DetailPoiRoute.name,
          args: DetailPoiRouteArgs(
            key: key,
            poiId: poiId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPoiRoute';

  static const _i32.PageInfo<DetailPoiRouteArgs> page =
      _i32.PageInfo<DetailPoiRouteArgs>(name);
}

class DetailPoiRouteArgs {
  const DetailPoiRouteArgs({
    this.key,
    required this.poiId,
  });

  final _i35.Key? key;

  final int poiId;

  @override
  String toString() {
    return 'DetailPoiRouteArgs{key: $key, poiId: $poiId}';
  }
}

/// generated route for
/// [_i6.EventDetailPage]
class EventDetailRoute extends _i32.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i33.Key? key,
    required int eventId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static const _i32.PageInfo<EventDetailRouteArgs> page =
      _i32.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.eventId,
  });

  final _i33.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i7.EventListPage]
class EventListRoute extends _i32.PageRouteInfo<void> {
  const EventListRoute({List<_i32.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i32.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i35.Key? key,
    required _i35.GlobalKey<_i33.ScaffoldState> scaffoldKey,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i32.PageInfo<HomeRouteArgs> page =
      _i32.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i35.Key? key;

  final _i35.GlobalKey<_i33.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i9.IssuesListPage]
class IssuesListRoute extends _i32.PageRouteInfo<void> {
  const IssuesListRoute({List<_i32.PageRouteInfo>? children})
      : super(
          IssuesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssuesListRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginSpidIdpListPage]
class LoginSpidIdpListRoute extends _i32.PageRouteInfo<void> {
  const LoginSpidIdpListRoute({List<_i32.PageRouteInfo>? children})
      : super(
          LoginSpidIdpListRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginSpidIdpListRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MainPage]
class MainRoute extends _i32.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i33.Key? key,
    required int municipalityId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i32.PageInfo<MainRouteArgs> page =
      _i32.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i33.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i12.MapsPage]
class MapsRoute extends _i32.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    _i35.Key? key,
    required _i35.GlobalKey<_i33.ScaffoldState> scaffoldKey,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const _i32.PageInfo<MapsRouteArgs> page =
      _i32.PageInfo<MapsRouteArgs>(name);
}

class MapsRouteArgs {
  const MapsRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i35.Key? key;

  final _i35.GlobalKey<_i33.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i13.MyWidget]
class MyWidget extends _i32.PageRouteInfo<void> {
  const MyWidget({List<_i32.PageRouteInfo>? children})
      : super(
          MyWidget.name,
          initialChildren: children,
        );

  static const String name = 'MyWidget';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NewIssuePager]
class NewIssueRouter extends _i32.PageRouteInfo<NewIssueRouterArgs> {
  NewIssueRouter({
    _i35.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          NewIssueRouter.name,
          args: NewIssueRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewIssueRouter';

  static const _i32.PageInfo<NewIssueRouterArgs> page =
      _i32.PageInfo<NewIssueRouterArgs>(name);
}

class NewIssueRouterArgs {
  const NewIssueRouterArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'NewIssueRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.NewsDetailPage]
class NewsDetailRoute extends _i32.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i33.Key? key,
    required int newsId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i32.PageInfo<NewsDetailRouteArgs> page =
      _i32.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i33.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i16.NewsListPage]
class NewsListRoute extends _i32.PageRouteInfo<void> {
  const NewsListRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i17.OnboardingPage]
class OnboardingRoute extends _i32.PageRouteInfo<void> {
  const OnboardingRoute({List<_i32.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i18.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i32.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i35.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static const _i32.PageInfo<OnboardingSearchMunicipalityRouteArgs> page =
      _i32.PageInfo<OnboardingSearchMunicipalityRouteArgs>(name);
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i19.OnlineServiceDetailWebviewPage]
class OnlineServiceDetailWebviewRoute
    extends _i32.PageRouteInfo<OnlineServiceDetailWebviewRouteArgs> {
  OnlineServiceDetailWebviewRoute({
    _i33.Key? key,
    required String url,
    required String name,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          OnlineServiceDetailWebviewRoute.name,
          args: OnlineServiceDetailWebviewRouteArgs(
            key: key,
            url: url,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'OnlineServiceDetailWebviewRoute';

  static const _i32.PageInfo<OnlineServiceDetailWebviewRouteArgs> page =
      _i32.PageInfo<OnlineServiceDetailWebviewRouteArgs>(name);
}

class OnlineServiceDetailWebviewRouteArgs {
  const OnlineServiceDetailWebviewRouteArgs({
    this.key,
    required this.url,
    required this.name,
  });

  final _i33.Key? key;

  final String url;

  final String name;

  @override
  String toString() {
    return 'OnlineServiceDetailWebviewRouteArgs{key: $key, url: $url, name: $name}';
  }
}

/// generated route for
/// [_i20.PersonalAreaMenuPage]
class PersonalAreaMenuRoute
    extends _i32.PageRouteInfo<PersonalAreaMenuRouteArgs> {
  PersonalAreaMenuRoute({
    _i35.Key? key,
    required _i35.GlobalKey<_i33.ScaffoldState> scaffoldKey,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          PersonalAreaMenuRoute.name,
          args: PersonalAreaMenuRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalAreaMenuRoute';

  static const _i32.PageInfo<PersonalAreaMenuRouteArgs> page =
      _i32.PageInfo<PersonalAreaMenuRouteArgs>(name);
}

class PersonalAreaMenuRouteArgs {
  const PersonalAreaMenuRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i35.Key? key;

  final _i35.GlobalKey<_i33.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'PersonalAreaMenuRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i21.PnrrDetailPage]
class PnrrDetailRoute extends _i32.PageRouteInfo<PnrrDetailRouteArgs> {
  PnrrDetailRoute({
    _i33.Key? key,
    required String type,
    required int id,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          PnrrDetailRoute.name,
          args: PnrrDetailRouteArgs(
            key: key,
            type: type,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrDetailRoute';

  static const _i32.PageInfo<PnrrDetailRouteArgs> page =
      _i32.PageInfo<PnrrDetailRouteArgs>(name);
}

class PnrrDetailRouteArgs {
  const PnrrDetailRouteArgs({
    this.key,
    required this.type,
    required this.id,
  });

  final _i33.Key? key;

  final String type;

  final int id;

  @override
  String toString() {
    return 'PnrrDetailRouteArgs{key: $key, type: $type, id: $id}';
  }
}

/// generated route for
/// [_i22.PnrrServicesPage]
class PnrrServicesRoute extends _i32.PageRouteInfo<PnrrServicesRouteArgs> {
  PnrrServicesRoute({
    _i33.Key? key,
    required String? type,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          PnrrServicesRoute.name,
          args: PnrrServicesRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrServicesRoute';

  static const _i32.PageInfo<PnrrServicesRouteArgs> page =
      _i32.PageInfo<PnrrServicesRouteArgs>(name);
}

class PnrrServicesRouteArgs {
  const PnrrServicesRouteArgs({
    this.key,
    required this.type,
  });

  final _i33.Key? key;

  final String? type;

  @override
  String toString() {
    return 'PnrrServicesRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i23.PointOfInterestListPage]
class PointOfInterestListRoute extends _i32.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ReservationsPager]
class ReservationsRouter extends _i32.PageRouteInfo<void> {
  const ReservationsRouter({List<_i32.PageRouteInfo>? children})
      : super(
          ReservationsRouter.name,
          initialChildren: children,
        );

  static const String name = 'ReservationsRouter';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ServiceOnlineListPage]
class ServiceOnlineListRoute
    extends _i32.PageRouteInfo<ServiceOnlineListRouteArgs> {
  ServiceOnlineListRoute({
    _i35.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ServiceOnlineListRoute.name,
          args: ServiceOnlineListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ServiceOnlineListRoute';

  static const _i32.PageInfo<ServiceOnlineListRouteArgs> page =
      _i32.PageInfo<ServiceOnlineListRouteArgs>(name);
}

class ServiceOnlineListRouteArgs {
  const ServiceOnlineListRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'ServiceOnlineListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i26.SettingsPage]
class SettingsRoute extends _i32.PageRouteInfo<void> {
  const SettingsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SplashPage]
class SplashRoute extends _i32.PageRouteInfo<void> {
  const SplashRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SubMenuPage]
class SubMenuRoute extends _i32.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i33.Key? key,
    required _i36.SubMenuType menu,
    required _i37.MenuItem item,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          SubMenuRoute.name,
          args: SubMenuRouteArgs(
            key: key,
            menu: menu,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'SubMenuRoute';

  static const _i32.PageInfo<SubMenuRouteArgs> page =
      _i32.PageInfo<SubMenuRouteArgs>(name);
}

class SubMenuRouteArgs {
  const SubMenuRouteArgs({
    this.key,
    required this.menu,
    required this.item,
  });

  final _i33.Key? key;

  final _i36.SubMenuType menu;

  final _i37.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i29.UserConfMenuEditPage]
class UserConfMenuEditRoute extends _i32.PageRouteInfo<void> {
  const UserConfMenuEditRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UserConfMenuEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserConfMenuEditRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i30.WebViewSpidAuthPage]
class WebViewSpidAuthRoute
    extends _i32.PageRouteInfo<WebViewSpidAuthRouteArgs> {
  WebViewSpidAuthRoute({
    _i33.Key? key,
    required String urlSpid,
    required String municipalityId,
    required String authSystem,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          WebViewSpidAuthRoute.name,
          args: WebViewSpidAuthRouteArgs(
            key: key,
            urlSpid: urlSpid,
            municipalityId: municipalityId,
            authSystem: authSystem,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewSpidAuthRoute';

  static const _i32.PageInfo<WebViewSpidAuthRouteArgs> page =
      _i32.PageInfo<WebViewSpidAuthRouteArgs>(name);
}

class WebViewSpidAuthRouteArgs {
  const WebViewSpidAuthRouteArgs({
    this.key,
    required this.urlSpid,
    required this.municipalityId,
    required this.authSystem,
  });

  final _i33.Key? key;

  final String urlSpid;

  final String municipalityId;

  final String authSystem;

  @override
  String toString() {
    return 'WebViewSpidAuthRouteArgs{key: $key, urlSpid: $urlSpid, municipalityId: $municipalityId, authSystem: $authSystem}';
  }
}

/// generated route for
/// [_i31.WelcomePage]
class WelcomeRoute extends _i32.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i35.Key? key,
    required int municipalityId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i32.PageInfo<WelcomeRouteArgs> page =
      _i32.PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i35.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
