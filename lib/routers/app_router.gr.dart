// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/cupertino.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:municipium/model/menu/menu_item.dart' as _i25;
import 'package:municipium/model/menu/submenu_type.dart' as _i24;
import 'package:municipium/ui/pages/events_section/event_detail_page.dart'
    as _i3;
import 'package:municipium/ui/pages/events_section/event_list_page.dart' as _i4;
import 'package:municipium/ui/pages/issues_section/issues_list_page.dart'
    as _i6;
import 'package:municipium/ui/pages/issues_section/new_issue_pager.dart' as _i9;
import 'package:municipium/ui/pages/main_page.dart' as _i7;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i1;
import 'package:municipium/ui/pages/municipality_section/home_page.dart' as _i5;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i20;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i10;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i11;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i12;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i13;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_page.dart'
    as _i14;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_webview.dart'
    as _i15;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_services_page.dart'
    as _i16;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i17;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i2;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i8;
import 'package:municipium/ui/pages/splash_page.dart' as _i18;
import 'package:municipium/ui/pages/submenu_page.dart' as _i19;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    CoreMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<CoreMunicipalityRouteArgs>(
          orElse: () => const CoreMunicipalityRouteArgs());
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i21.WrappedRoute(child: _i1.CoreMunicipalityPage(key: args.key)),
      );
    },
    DetailPoiRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPoiRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i2.DetailPoiPage(
          key: args.key,
          poiId: args.poiId,
        )),
      );
    },
    EventDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i3.EventDetailPage(
          key: args.key,
          eventId: args.eventId,
        )),
      );
    },
    EventListRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i4.EventListPage()),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomePage(key: args.key),
      );
    },
    IssuesListRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i6.IssuesListPage()),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i7.MainPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    MapsRoute.name: (routeData) {
      final args = routeData.argsAs<MapsRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i8.MapsPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        )),
      );
    },
    NewIssueRouter.name: (routeData) {
      final args = routeData.argsAs<NewIssueRouterArgs>(
          orElse: () => const NewIssueRouterArgs());
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: _i9.NewIssuePager(key: args.key)),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i10.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i11.NewsListPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OnboardingPage(),
      );
    },
    OnboardingSearchMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i13.OnboardingSearchMunicipalityPage(key: args.key)),
      );
    },
    PnrrDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i14.PnrrDetailPage(
          key: args.key,
          type: args.type,
          id: args.id,
        )),
      );
    },
    PnrrDetailWebviewRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailWebviewRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.PnrrDetailWebviewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    PnrrServicesRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrServicesRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i16.PnrrServicesPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i17.PointOfInterestListPage()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashPage(),
      );
    },
    SubMenuRoute.name: (routeData) {
      final args = routeData.argsAs<SubMenuRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.SubMenuPage(
          key: args.key,
          menu: args.menu,
          item: args.item,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i20.WelcomePage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.CoreMunicipalityPage]
class CoreMunicipalityRoute
    extends _i21.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static const _i21.PageInfo<CoreMunicipalityRouteArgs> page =
      _i21.PageInfo<CoreMunicipalityRouteArgs>(name);
}

class CoreMunicipalityRouteArgs {
  const CoreMunicipalityRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DetailPoiPage]
class DetailPoiRoute extends _i21.PageRouteInfo<DetailPoiRouteArgs> {
  DetailPoiRoute({
    _i22.Key? key,
    required int poiId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          DetailPoiRoute.name,
          args: DetailPoiRouteArgs(
            key: key,
            poiId: poiId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPoiRoute';

  static const _i21.PageInfo<DetailPoiRouteArgs> page =
      _i21.PageInfo<DetailPoiRouteArgs>(name);
}

class DetailPoiRouteArgs {
  const DetailPoiRouteArgs({
    this.key,
    required this.poiId,
  });

  final _i22.Key? key;

  final int poiId;

  @override
  String toString() {
    return 'DetailPoiRouteArgs{key: $key, poiId: $poiId}';
  }
}

/// generated route for
/// [_i3.EventDetailPage]
class EventDetailRoute extends _i21.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i23.Key? key,
    required int eventId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static const _i21.PageInfo<EventDetailRouteArgs> page =
      _i21.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.eventId,
  });

  final _i23.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i4.EventListPage]
class EventListRoute extends _i21.PageRouteInfo<void> {
  const EventListRoute({List<_i21.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i21.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i21.PageInfo<HomeRouteArgs> page =
      _i21.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.IssuesListPage]
class IssuesListRoute extends _i21.PageRouteInfo<void> {
  const IssuesListRoute({List<_i21.PageRouteInfo>? children})
      : super(
          IssuesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssuesListRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i21.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i23.Key? key,
    required int municipalityId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i21.PageInfo<MainRouteArgs> page =
      _i21.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i23.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i8.MapsPage]
class MapsRoute extends _i21.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    _i22.Key? key,
    required _i22.GlobalKey<_i23.ScaffoldState> scaffoldKey,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const _i21.PageInfo<MapsRouteArgs> page =
      _i21.PageInfo<MapsRouteArgs>(name);
}

class MapsRouteArgs {
  const MapsRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i22.Key? key;

  final _i22.GlobalKey<_i23.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i9.NewIssuePager]
class NewIssueRouter extends _i21.PageRouteInfo<NewIssueRouterArgs> {
  NewIssueRouter({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          NewIssueRouter.name,
          args: NewIssueRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewIssueRouter';

  static const _i21.PageInfo<NewIssueRouterArgs> page =
      _i21.PageInfo<NewIssueRouterArgs>(name);
}

class NewIssueRouterArgs {
  const NewIssueRouterArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'NewIssueRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.NewsDetailPage]
class NewsDetailRoute extends _i21.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i23.Key? key,
    required int newsId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i21.PageInfo<NewsDetailRouteArgs> page =
      _i21.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i23.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i11.NewsListPage]
class NewsListRoute extends _i21.PageRouteInfo<void> {
  const NewsListRoute({List<_i21.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OnboardingPage]
class OnboardingRoute extends _i21.PageRouteInfo<void> {
  const OnboardingRoute({List<_i21.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i21.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static const _i21.PageInfo<OnboardingSearchMunicipalityRouteArgs> page =
      _i21.PageInfo<OnboardingSearchMunicipalityRouteArgs>(name);
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.PnrrDetailPage]
class PnrrDetailRoute extends _i21.PageRouteInfo<PnrrDetailRouteArgs> {
  PnrrDetailRoute({
    _i23.Key? key,
    required String type,
    required int id,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<PnrrDetailRouteArgs> page =
      _i21.PageInfo<PnrrDetailRouteArgs>(name);
}

class PnrrDetailRouteArgs {
  const PnrrDetailRouteArgs({
    this.key,
    required this.type,
    required this.id,
  });

  final _i23.Key? key;

  final String type;

  final int id;

  @override
  String toString() {
    return 'PnrrDetailRouteArgs{key: $key, type: $type, id: $id}';
  }
}

/// generated route for
/// [_i15.PnrrDetailWebviewPage]
class PnrrDetailWebviewRoute
    extends _i21.PageRouteInfo<PnrrDetailWebviewRouteArgs> {
  PnrrDetailWebviewRoute({
    _i23.Key? key,
    required String url,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          PnrrDetailWebviewRoute.name,
          args: PnrrDetailWebviewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrDetailWebviewRoute';

  static const _i21.PageInfo<PnrrDetailWebviewRouteArgs> page =
      _i21.PageInfo<PnrrDetailWebviewRouteArgs>(name);
}

class PnrrDetailWebviewRouteArgs {
  const PnrrDetailWebviewRouteArgs({
    this.key,
    required this.url,
  });

  final _i23.Key? key;

  final String url;

  @override
  String toString() {
    return 'PnrrDetailWebviewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i16.PnrrServicesPage]
class PnrrServicesRoute extends _i21.PageRouteInfo<PnrrServicesRouteArgs> {
  PnrrServicesRoute({
    _i23.Key? key,
    required String? type,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          PnrrServicesRoute.name,
          args: PnrrServicesRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrServicesRoute';

  static const _i21.PageInfo<PnrrServicesRouteArgs> page =
      _i21.PageInfo<PnrrServicesRouteArgs>(name);
}

class PnrrServicesRouteArgs {
  const PnrrServicesRouteArgs({
    this.key,
    required this.type,
  });

  final _i23.Key? key;

  final String? type;

  @override
  String toString() {
    return 'PnrrServicesRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i17.PointOfInterestListPage]
class PointOfInterestListRoute extends _i21.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i21.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SplashPage]
class SplashRoute extends _i21.PageRouteInfo<void> {
  const SplashRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SubMenuPage]
class SubMenuRoute extends _i21.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i23.Key? key,
    required _i24.SubMenuType menu,
    required _i25.MenuItem item,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<SubMenuRouteArgs> page =
      _i21.PageInfo<SubMenuRouteArgs>(name);
}

class SubMenuRouteArgs {
  const SubMenuRouteArgs({
    this.key,
    required this.menu,
    required this.item,
  });

  final _i23.Key? key;

  final _i24.SubMenuType menu;

  final _i25.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i20.WelcomePage]
class WelcomeRoute extends _i21.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i22.Key? key,
    required int municipalityId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i21.PageInfo<WelcomeRouteArgs> page =
      _i21.PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i22.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
