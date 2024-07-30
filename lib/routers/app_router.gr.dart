// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i29;
import 'package:flutter/cupertino.dart' as _i30;
import 'package:flutter/material.dart' as _i31;
import 'package:municipium/model/menu/menu_item.dart' as _i33;
import 'package:municipium/model/menu/submenu_type.dart' as _i32;
import 'package:municipium/ui/pages/events_section/event_detail_page.dart'
    as _i4;
import 'package:municipium/ui/pages/events_section/event_list_page.dart' as _i5;
import 'package:municipium/ui/pages/issues_section/issues_list_page.dart'
    as _i7;
import 'package:municipium/ui/pages/issues_section/new_issue_pager.dart'
    as _i12;
import 'package:municipium/ui/pages/main_page.dart' as _i9;
import 'package:municipium/ui/pages/municipality_section/choose_municipality_page.dart'
    as _i1;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i2;
import 'package:municipium/ui/pages/municipality_section/home_page.dart' as _i6;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i28;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i13;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i14;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i15;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i16;
import 'package:municipium/ui/pages/personal_area_section/confirm_auth_spid_page.dart'
    as _i11;
import 'package:municipium/ui/pages/personal_area_section/login_spid_idp_list_page.dart'
    as _i8;
import 'package:municipium/ui/pages/personal_area_section/personal_area_menu_page.dart'
    as _i17;
import 'package:municipium/ui/pages/personal_area_section/webview_spid_auth_page.dart'
    as _i27;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_page.dart'
    as _i18;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_webview.dart'
    as _i19;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_services_page.dart'
    as _i20;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i21;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i3;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i10;
import 'package:municipium/ui/pages/reservations_section/reservations_pager.dart'
    as _i22;
import 'package:municipium/ui/pages/settings_section/settings_page.dart'
    as _i23;
import 'package:municipium/ui/pages/splash_page.dart' as _i24;
import 'package:municipium/ui/pages/submenu_page.dart' as _i25;
import 'package:municipium/ui/pages/user_configuration_section/user_conf_menu_edit_page.dart'
    as _i26;

abstract class $AppRouter extends _i29.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i29.PageFactory> pagesMap = {
    ChooseMunicipalityRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: const _i1.ChooseMunicipalityPage()),
      );
    },
    CoreMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<CoreMunicipalityRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CoreMunicipalityPage(
          key: args.key,
          municipalityId: args.municipalityId,
        ),
      );
    },
    DetailPoiRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPoiRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i3.DetailPoiPage(
          key: args.key,
          poiId: args.poiId,
        )),
      );
    },
    EventDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i4.EventDetailPage(
          key: args.key,
          eventId: args.eventId,
        )),
      );
    },
    EventListRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: const _i5.EventListPage()),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomePage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    IssuesListRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: const _i7.IssuesListPage()),
      );
    },
    LoginSpidIdpListRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: const _i8.LoginSpidIdpListPage()),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i9.MainPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    MapsRoute.name: (routeData) {
      final args = routeData.argsAs<MapsRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i10.MapsPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        )),
      );
    },
    MyWidget.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyWidget(),
      );
    },
    NewIssueRouter.name: (routeData) {
      final args = routeData.argsAs<NewIssueRouterArgs>(
          orElse: () => const NewIssueRouterArgs());
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: _i12.NewIssuePager(key: args.key)),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i13.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: const _i14.NewsListPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OnboardingPage(),
      );
    },
    OnboardingSearchMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i16.OnboardingSearchMunicipalityPage(key: args.key)),
      );
    },
    PersonalAreaMenuRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalAreaMenuRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.PersonalAreaMenuPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    PnrrDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i18.PnrrDetailPage(
          key: args.key,
          type: args.type,
          id: args.id,
        )),
      );
    },
    PnrrDetailWebviewRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailWebviewRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.PnrrDetailWebviewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    PnrrServicesRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrServicesRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i20.PnrrServicesPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: const _i21.PointOfInterestListPage()),
      );
    },
    ReservationsRouter.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(child: const _i22.ReservationsPager()),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SplashPage(),
      );
    },
    SubMenuRoute.name: (routeData) {
      final args = routeData.argsAs<SubMenuRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.SubMenuPage(
          key: args.key,
          menu: args.menu,
          item: args.item,
        ),
      );
    },
    UserConfMenuEditRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.UserConfMenuEditPage(),
      );
    },
    WebViewSpidAuthRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewSpidAuthRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i27.WebViewSpidAuthPage(
          key: args.key,
          urlSpid: args.urlSpid,
          municipalityId: args.municipalityId,
          authSystem: args.authSystem,
        )),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WrappedRoute(
            child: _i28.WelcomePage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.ChooseMunicipalityPage]
class ChooseMunicipalityRoute extends _i29.PageRouteInfo<void> {
  const ChooseMunicipalityRoute({List<_i29.PageRouteInfo>? children})
      : super(
          ChooseMunicipalityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseMunicipalityRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CoreMunicipalityPage]
class CoreMunicipalityRoute
    extends _i29.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i30.Key? key,
    required int municipalityId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static const _i29.PageInfo<CoreMunicipalityRouteArgs> page =
      _i29.PageInfo<CoreMunicipalityRouteArgs>(name);
}

class CoreMunicipalityRouteArgs {
  const CoreMunicipalityRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i30.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i3.DetailPoiPage]
class DetailPoiRoute extends _i29.PageRouteInfo<DetailPoiRouteArgs> {
  DetailPoiRoute({
    _i30.Key? key,
    required int poiId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          DetailPoiRoute.name,
          args: DetailPoiRouteArgs(
            key: key,
            poiId: poiId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPoiRoute';

  static const _i29.PageInfo<DetailPoiRouteArgs> page =
      _i29.PageInfo<DetailPoiRouteArgs>(name);
}

class DetailPoiRouteArgs {
  const DetailPoiRouteArgs({
    this.key,
    required this.poiId,
  });

  final _i30.Key? key;

  final int poiId;

  @override
  String toString() {
    return 'DetailPoiRouteArgs{key: $key, poiId: $poiId}';
  }
}

/// generated route for
/// [_i4.EventDetailPage]
class EventDetailRoute extends _i29.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i31.Key? key,
    required int eventId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static const _i29.PageInfo<EventDetailRouteArgs> page =
      _i29.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.eventId,
  });

  final _i31.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i5.EventListPage]
class EventListRoute extends _i29.PageRouteInfo<void> {
  const EventListRoute({List<_i29.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i29.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i30.Key? key,
    required _i30.GlobalKey<_i31.ScaffoldState> scaffoldKey,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i29.PageInfo<HomeRouteArgs> page =
      _i29.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i30.Key? key;

  final _i30.GlobalKey<_i31.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i7.IssuesListPage]
class IssuesListRoute extends _i29.PageRouteInfo<void> {
  const IssuesListRoute({List<_i29.PageRouteInfo>? children})
      : super(
          IssuesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssuesListRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginSpidIdpListPage]
class LoginSpidIdpListRoute extends _i29.PageRouteInfo<void> {
  const LoginSpidIdpListRoute({List<_i29.PageRouteInfo>? children})
      : super(
          LoginSpidIdpListRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginSpidIdpListRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MainPage]
class MainRoute extends _i29.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i31.Key? key,
    required int municipalityId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i29.PageInfo<MainRouteArgs> page =
      _i29.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i31.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i10.MapsPage]
class MapsRoute extends _i29.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    _i30.Key? key,
    required _i30.GlobalKey<_i31.ScaffoldState> scaffoldKey,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const _i29.PageInfo<MapsRouteArgs> page =
      _i29.PageInfo<MapsRouteArgs>(name);
}

class MapsRouteArgs {
  const MapsRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i30.Key? key;

  final _i30.GlobalKey<_i31.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i11.MyWidget]
class MyWidget extends _i29.PageRouteInfo<void> {
  const MyWidget({List<_i29.PageRouteInfo>? children})
      : super(
          MyWidget.name,
          initialChildren: children,
        );

  static const String name = 'MyWidget';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NewIssuePager]
class NewIssueRouter extends _i29.PageRouteInfo<NewIssueRouterArgs> {
  NewIssueRouter({
    _i30.Key? key,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          NewIssueRouter.name,
          args: NewIssueRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewIssueRouter';

  static const _i29.PageInfo<NewIssueRouterArgs> page =
      _i29.PageInfo<NewIssueRouterArgs>(name);
}

class NewIssueRouterArgs {
  const NewIssueRouterArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'NewIssueRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.NewsDetailPage]
class NewsDetailRoute extends _i29.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i31.Key? key,
    required int newsId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i29.PageInfo<NewsDetailRouteArgs> page =
      _i29.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i31.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i14.NewsListPage]
class NewsListRoute extends _i29.PageRouteInfo<void> {
  const NewsListRoute({List<_i29.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OnboardingPage]
class OnboardingRoute extends _i29.PageRouteInfo<void> {
  const OnboardingRoute({List<_i29.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i29.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i30.Key? key,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static const _i29.PageInfo<OnboardingSearchMunicipalityRouteArgs> page =
      _i29.PageInfo<OnboardingSearchMunicipalityRouteArgs>(name);
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.PersonalAreaMenuPage]
class PersonalAreaMenuRoute
    extends _i29.PageRouteInfo<PersonalAreaMenuRouteArgs> {
  PersonalAreaMenuRoute({
    _i31.Key? key,
    required _i31.GlobalKey<_i31.ScaffoldState> scaffoldKey,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          PersonalAreaMenuRoute.name,
          args: PersonalAreaMenuRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalAreaMenuRoute';

  static const _i29.PageInfo<PersonalAreaMenuRouteArgs> page =
      _i29.PageInfo<PersonalAreaMenuRouteArgs>(name);
}

class PersonalAreaMenuRouteArgs {
  const PersonalAreaMenuRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i31.Key? key;

  final _i31.GlobalKey<_i31.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'PersonalAreaMenuRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i18.PnrrDetailPage]
class PnrrDetailRoute extends _i29.PageRouteInfo<PnrrDetailRouteArgs> {
  PnrrDetailRoute({
    _i31.Key? key,
    required String type,
    required int id,
    List<_i29.PageRouteInfo>? children,
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

  static const _i29.PageInfo<PnrrDetailRouteArgs> page =
      _i29.PageInfo<PnrrDetailRouteArgs>(name);
}

class PnrrDetailRouteArgs {
  const PnrrDetailRouteArgs({
    this.key,
    required this.type,
    required this.id,
  });

  final _i31.Key? key;

  final String type;

  final int id;

  @override
  String toString() {
    return 'PnrrDetailRouteArgs{key: $key, type: $type, id: $id}';
  }
}

/// generated route for
/// [_i19.PnrrDetailWebviewPage]
class PnrrDetailWebviewRoute
    extends _i29.PageRouteInfo<PnrrDetailWebviewRouteArgs> {
  PnrrDetailWebviewRoute({
    _i31.Key? key,
    required String url,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          PnrrDetailWebviewRoute.name,
          args: PnrrDetailWebviewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrDetailWebviewRoute';

  static const _i29.PageInfo<PnrrDetailWebviewRouteArgs> page =
      _i29.PageInfo<PnrrDetailWebviewRouteArgs>(name);
}

class PnrrDetailWebviewRouteArgs {
  const PnrrDetailWebviewRouteArgs({
    this.key,
    required this.url,
  });

  final _i31.Key? key;

  final String url;

  @override
  String toString() {
    return 'PnrrDetailWebviewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i20.PnrrServicesPage]
class PnrrServicesRoute extends _i29.PageRouteInfo<PnrrServicesRouteArgs> {
  PnrrServicesRoute({
    _i31.Key? key,
    required String? type,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          PnrrServicesRoute.name,
          args: PnrrServicesRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrServicesRoute';

  static const _i29.PageInfo<PnrrServicesRouteArgs> page =
      _i29.PageInfo<PnrrServicesRouteArgs>(name);
}

class PnrrServicesRouteArgs {
  const PnrrServicesRouteArgs({
    this.key,
    required this.type,
  });

  final _i31.Key? key;

  final String? type;

  @override
  String toString() {
    return 'PnrrServicesRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i21.PointOfInterestListPage]
class PointOfInterestListRoute extends _i29.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i29.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ReservationsPager]
class ReservationsRouter extends _i29.PageRouteInfo<void> {
  const ReservationsRouter({List<_i29.PageRouteInfo>? children})
      : super(
          ReservationsRouter.name,
          initialChildren: children,
        );

  static const String name = 'ReservationsRouter';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SettingsPage]
class SettingsRoute extends _i29.PageRouteInfo<void> {
  const SettingsRoute({List<_i29.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SplashPage]
class SplashRoute extends _i29.PageRouteInfo<void> {
  const SplashRoute({List<_i29.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SubMenuPage]
class SubMenuRoute extends _i29.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i31.Key? key,
    required _i32.SubMenuType menu,
    required _i33.MenuItem item,
    List<_i29.PageRouteInfo>? children,
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

  static const _i29.PageInfo<SubMenuRouteArgs> page =
      _i29.PageInfo<SubMenuRouteArgs>(name);
}

class SubMenuRouteArgs {
  const SubMenuRouteArgs({
    this.key,
    required this.menu,
    required this.item,
  });

  final _i31.Key? key;

  final _i32.SubMenuType menu;

  final _i33.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i26.UserConfMenuEditPage]
class UserConfMenuEditRoute extends _i29.PageRouteInfo<void> {
  const UserConfMenuEditRoute({List<_i29.PageRouteInfo>? children})
      : super(
          UserConfMenuEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserConfMenuEditRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i27.WebViewSpidAuthPage]
class WebViewSpidAuthRoute
    extends _i29.PageRouteInfo<WebViewSpidAuthRouteArgs> {
  WebViewSpidAuthRoute({
    _i31.Key? key,
    required String urlSpid,
    required String municipalityId,
    required String authSystem,
    List<_i29.PageRouteInfo>? children,
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

  static const _i29.PageInfo<WebViewSpidAuthRouteArgs> page =
      _i29.PageInfo<WebViewSpidAuthRouteArgs>(name);
}

class WebViewSpidAuthRouteArgs {
  const WebViewSpidAuthRouteArgs({
    this.key,
    required this.urlSpid,
    required this.municipalityId,
    required this.authSystem,
  });

  final _i31.Key? key;

  final String urlSpid;

  final String municipalityId;

  final String authSystem;

  @override
  String toString() {
    return 'WebViewSpidAuthRouteArgs{key: $key, urlSpid: $urlSpid, municipalityId: $municipalityId, authSystem: $authSystem}';
  }
}

/// generated route for
/// [_i28.WelcomePage]
class WelcomeRoute extends _i29.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i30.Key? key,
    required int municipalityId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i29.PageInfo<WelcomeRouteArgs> page =
      _i29.PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i30.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
