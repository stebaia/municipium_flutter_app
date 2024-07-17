// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/cupertino.dart' as _i28;
import 'package:flutter/material.dart' as _i29;
import 'package:municipium/model/menu/menu_item.dart' as _i31;
import 'package:municipium/model/menu/submenu_type.dart' as _i30;
import 'package:municipium/ui/pages/events_section/event_detail_page.dart'
    as _i4;
import 'package:municipium/ui/pages/events_section/event_list_page.dart' as _i5;
import 'package:municipium/ui/pages/issues_section/issue_detail_page.dart'
    as _i7;
import 'package:municipium/ui/pages/issues_section/issues_list_page.dart'
    as _i8;
import 'package:municipium/ui/pages/issues_section/new_issue_pager.dart'
    as _i11;
import 'package:municipium/ui/pages/issues_section/newissue_completed_page.dart'
    as _i12;
import 'package:municipium/ui/pages/main_page.dart' as _i9;
import 'package:municipium/ui/pages/municipality_section/choose_municipality_page.dart'
    as _i1;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i2;
import 'package:municipium/ui/pages/municipality_section/home_page.dart' as _i6;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i26;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i13;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i14;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i15;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i16;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_page.dart'
    as _i17;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_webview.dart'
    as _i18;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_services_page.dart'
    as _i19;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i20;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i3;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i10;
import 'package:municipium/ui/pages/reservations_section/reservations_pager.dart'
    as _i21;
import 'package:municipium/ui/pages/settings_section/settings_page.dart'
    as _i22;
import 'package:municipium/ui/pages/splash_page.dart' as _i23;
import 'package:municipium/ui/pages/submenu_page.dart' as _i24;
import 'package:municipium/ui/pages/user_configuration_section/user_conf_menu_edit_page.dart'
    as _i25;

abstract class $AppRouter extends _i27.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    ChooseMunicipalityRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i1.ChooseMunicipalityPage()),
      );
    },
    CoreMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<CoreMunicipalityRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i2.CoreMunicipalityPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    DetailPoiRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPoiRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i3.DetailPoiPage(
          key: args.key,
          poiId: args.poiId,
        )),
      );
    },
    EventDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i4.EventDetailPage(
          key: args.key,
          eventId: args.eventId,
        )),
      );
    },
    EventListRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i5.EventListPage()),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomePage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    IssueDetailRoute.name: (routeData) {
      final args = routeData.argsAs<IssueDetailRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i7.IssueDetailPage(
          key: args.key,
          id: args.id,
          udid: args.udid,
        )),
      );
    },
    IssuesListRoute.name: (routeData) {
      final args = routeData.argsAs<IssuesListRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i8.IssuesListPage(
          key: args.key,
          udid: args.udid,
        )),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i9.MainPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    MapsRoute.name: (routeData) {
      final args = routeData.argsAs<MapsRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i10.MapsPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        )),
      );
    },
    NewIssueRouter.name: (routeData) {
      final args = routeData.argsAs<NewIssueRouterArgs>(
          orElse: () => const NewIssueRouterArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: _i11.NewIssuePager(key: args.key)),
      );
    },
    NewissueCompletedRoute.name: (routeData) {
      final args = routeData.argsAs<NewissueCompletedRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.NewissueCompletedPage(
          key: args.key,
          udid: args.udid,
        ),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i13.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i14.NewsListPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OnboardingPage(),
      );
    },
    OnboardingSearchMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i16.OnboardingSearchMunicipalityPage(key: args.key)),
      );
    },
    PnrrDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i17.PnrrDetailPage(
          key: args.key,
          type: args.type,
          id: args.id,
        )),
      );
    },
    PnrrDetailWebviewRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailWebviewRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.PnrrDetailWebviewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    PnrrServicesRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrServicesRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i19.PnrrServicesPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i20.PointOfInterestListPage()),
      );
    },
    ReservationsRouter.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i21.ReservationsPager()),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SplashPage(),
      );
    },
    SubMenuRoute.name: (routeData) {
      final args = routeData.argsAs<SubMenuRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.SubMenuPage(
          key: args.key,
          menu: args.menu,
          item: args.item,
        ),
      );
    },
    UserConfMenuEditRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.UserConfMenuEditPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(
            child: _i26.WelcomePage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.ChooseMunicipalityPage]
class ChooseMunicipalityRoute extends _i27.PageRouteInfo<void> {
  const ChooseMunicipalityRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ChooseMunicipalityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseMunicipalityRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CoreMunicipalityPage]
class CoreMunicipalityRoute
    extends _i27.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i28.Key? key,
    required int municipalityId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static const _i27.PageInfo<CoreMunicipalityRouteArgs> page =
      _i27.PageInfo<CoreMunicipalityRouteArgs>(name);
}

class CoreMunicipalityRouteArgs {
  const CoreMunicipalityRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i28.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i3.DetailPoiPage]
class DetailPoiRoute extends _i27.PageRouteInfo<DetailPoiRouteArgs> {
  DetailPoiRoute({
    _i28.Key? key,
    required int poiId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          DetailPoiRoute.name,
          args: DetailPoiRouteArgs(
            key: key,
            poiId: poiId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPoiRoute';

  static const _i27.PageInfo<DetailPoiRouteArgs> page =
      _i27.PageInfo<DetailPoiRouteArgs>(name);
}

class DetailPoiRouteArgs {
  const DetailPoiRouteArgs({
    this.key,
    required this.poiId,
  });

  final _i28.Key? key;

  final int poiId;

  @override
  String toString() {
    return 'DetailPoiRouteArgs{key: $key, poiId: $poiId}';
  }
}

/// generated route for
/// [_i4.EventDetailPage]
class EventDetailRoute extends _i27.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i29.Key? key,
    required int eventId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static const _i27.PageInfo<EventDetailRouteArgs> page =
      _i27.PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.eventId,
  });

  final _i29.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i5.EventListPage]
class EventListRoute extends _i27.PageRouteInfo<void> {
  const EventListRoute({List<_i27.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i27.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i28.Key? key,
    required _i28.GlobalKey<_i29.ScaffoldState> scaffoldKey,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i27.PageInfo<HomeRouteArgs> page =
      _i27.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i28.Key? key;

  final _i28.GlobalKey<_i29.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i7.IssueDetailPage]
class IssueDetailRoute extends _i27.PageRouteInfo<IssueDetailRouteArgs> {
  IssueDetailRoute({
    _i29.Key? key,
    required int id,
    required String udid,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          IssueDetailRoute.name,
          args: IssueDetailRouteArgs(
            key: key,
            id: id,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueDetailRoute';

  static const _i27.PageInfo<IssueDetailRouteArgs> page =
      _i27.PageInfo<IssueDetailRouteArgs>(name);
}

class IssueDetailRouteArgs {
  const IssueDetailRouteArgs({
    this.key,
    required this.id,
    required this.udid,
  });

  final _i29.Key? key;

  final int id;

  final String udid;

  @override
  String toString() {
    return 'IssueDetailRouteArgs{key: $key, id: $id, udid: $udid}';
  }
}

/// generated route for
/// [_i8.IssuesListPage]
class IssuesListRoute extends _i27.PageRouteInfo<IssuesListRouteArgs> {
  IssuesListRoute({
    _i29.Key? key,
    required String udid,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          IssuesListRoute.name,
          args: IssuesListRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'IssuesListRoute';

  static const _i27.PageInfo<IssuesListRouteArgs> page =
      _i27.PageInfo<IssuesListRouteArgs>(name);
}

class IssuesListRouteArgs {
  const IssuesListRouteArgs({
    this.key,
    required this.udid,
  });

  final _i29.Key? key;

  final String udid;

  @override
  String toString() {
    return 'IssuesListRouteArgs{key: $key, udid: $udid}';
  }
}

/// generated route for
/// [_i9.MainPage]
class MainRoute extends _i27.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i29.Key? key,
    required int municipalityId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i27.PageInfo<MainRouteArgs> page =
      _i27.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i29.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i10.MapsPage]
class MapsRoute extends _i27.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    _i28.Key? key,
    required _i28.GlobalKey<_i29.ScaffoldState> scaffoldKey,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const _i27.PageInfo<MapsRouteArgs> page =
      _i27.PageInfo<MapsRouteArgs>(name);
}

class MapsRouteArgs {
  const MapsRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i28.Key? key;

  final _i28.GlobalKey<_i29.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i11.NewIssuePager]
class NewIssueRouter extends _i27.PageRouteInfo<NewIssueRouterArgs> {
  NewIssueRouter({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          NewIssueRouter.name,
          args: NewIssueRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewIssueRouter';

  static const _i27.PageInfo<NewIssueRouterArgs> page =
      _i27.PageInfo<NewIssueRouterArgs>(name);
}

class NewIssueRouterArgs {
  const NewIssueRouterArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'NewIssueRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.NewissueCompletedPage]
class NewissueCompletedRoute
    extends _i27.PageRouteInfo<NewissueCompletedRouteArgs> {
  NewissueCompletedRoute({
    _i29.Key? key,
    required String udid,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          NewissueCompletedRoute.name,
          args: NewissueCompletedRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'NewissueCompletedRoute';

  static const _i27.PageInfo<NewissueCompletedRouteArgs> page =
      _i27.PageInfo<NewissueCompletedRouteArgs>(name);
}

class NewissueCompletedRouteArgs {
  const NewissueCompletedRouteArgs({
    this.key,
    required this.udid,
  });

  final _i29.Key? key;

  final String udid;

  @override
  String toString() {
    return 'NewissueCompletedRouteArgs{key: $key, udid: $udid}';
  }
}

/// generated route for
/// [_i13.NewsDetailPage]
class NewsDetailRoute extends _i27.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i29.Key? key,
    required int newsId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i27.PageInfo<NewsDetailRouteArgs> page =
      _i27.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i29.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i14.NewsListPage]
class NewsListRoute extends _i27.PageRouteInfo<void> {
  const NewsListRoute({List<_i27.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OnboardingPage]
class OnboardingRoute extends _i27.PageRouteInfo<void> {
  const OnboardingRoute({List<_i27.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i27.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static const _i27.PageInfo<OnboardingSearchMunicipalityRouteArgs> page =
      _i27.PageInfo<OnboardingSearchMunicipalityRouteArgs>(name);
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.PnrrDetailPage]
class PnrrDetailRoute extends _i27.PageRouteInfo<PnrrDetailRouteArgs> {
  PnrrDetailRoute({
    _i29.Key? key,
    required String type,
    required int id,
    List<_i27.PageRouteInfo>? children,
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

  static const _i27.PageInfo<PnrrDetailRouteArgs> page =
      _i27.PageInfo<PnrrDetailRouteArgs>(name);
}

class PnrrDetailRouteArgs {
  const PnrrDetailRouteArgs({
    this.key,
    required this.type,
    required this.id,
  });

  final _i29.Key? key;

  final String type;

  final int id;

  @override
  String toString() {
    return 'PnrrDetailRouteArgs{key: $key, type: $type, id: $id}';
  }
}

/// generated route for
/// [_i18.PnrrDetailWebviewPage]
class PnrrDetailWebviewRoute
    extends _i27.PageRouteInfo<PnrrDetailWebviewRouteArgs> {
  PnrrDetailWebviewRoute({
    _i29.Key? key,
    required String url,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          PnrrDetailWebviewRoute.name,
          args: PnrrDetailWebviewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrDetailWebviewRoute';

  static const _i27.PageInfo<PnrrDetailWebviewRouteArgs> page =
      _i27.PageInfo<PnrrDetailWebviewRouteArgs>(name);
}

class PnrrDetailWebviewRouteArgs {
  const PnrrDetailWebviewRouteArgs({
    this.key,
    required this.url,
  });

  final _i29.Key? key;

  final String url;

  @override
  String toString() {
    return 'PnrrDetailWebviewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i19.PnrrServicesPage]
class PnrrServicesRoute extends _i27.PageRouteInfo<PnrrServicesRouteArgs> {
  PnrrServicesRoute({
    _i29.Key? key,
    required String? type,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          PnrrServicesRoute.name,
          args: PnrrServicesRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrServicesRoute';

  static const _i27.PageInfo<PnrrServicesRouteArgs> page =
      _i27.PageInfo<PnrrServicesRouteArgs>(name);
}

class PnrrServicesRouteArgs {
  const PnrrServicesRouteArgs({
    this.key,
    required this.type,
  });

  final _i29.Key? key;

  final String? type;

  @override
  String toString() {
    return 'PnrrServicesRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i20.PointOfInterestListPage]
class PointOfInterestListRoute extends _i27.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i27.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ReservationsPager]
class ReservationsRouter extends _i27.PageRouteInfo<void> {
  const ReservationsRouter({List<_i27.PageRouteInfo>? children})
      : super(
          ReservationsRouter.name,
          initialChildren: children,
        );

  static const String name = 'ReservationsRouter';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SettingsPage]
class SettingsRoute extends _i27.PageRouteInfo<void> {
  const SettingsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SplashPage]
class SplashRoute extends _i27.PageRouteInfo<void> {
  const SplashRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SubMenuPage]
class SubMenuRoute extends _i27.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i29.Key? key,
    required _i30.SubMenuType menu,
    required _i31.MenuItem item,
    List<_i27.PageRouteInfo>? children,
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

  static const _i27.PageInfo<SubMenuRouteArgs> page =
      _i27.PageInfo<SubMenuRouteArgs>(name);
}

class SubMenuRouteArgs {
  const SubMenuRouteArgs({
    this.key,
    required this.menu,
    required this.item,
  });

  final _i29.Key? key;

  final _i30.SubMenuType menu;

  final _i31.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i25.UserConfMenuEditPage]
class UserConfMenuEditRoute extends _i27.PageRouteInfo<void> {
  const UserConfMenuEditRoute({List<_i27.PageRouteInfo>? children})
      : super(
          UserConfMenuEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserConfMenuEditRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i26.WelcomePage]
class WelcomeRoute extends _i27.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i28.Key? key,
    required int municipalityId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i27.PageInfo<WelcomeRouteArgs> page =
      _i27.PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i28.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
