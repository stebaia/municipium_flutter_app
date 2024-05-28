// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/cupertino.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:municipium/model/menu/menu_item.dart' as _i19;
import 'package:municipium/model/menu/submenu_type.dart' as _i18;
import 'package:municipium/ui/pages/events_section/event_list_page.dart' as _i3;
import 'package:municipium/ui/pages/main_page.dart' as _i5;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i1;
import 'package:municipium/ui/pages/municipality_section/home_page.dart' as _i4;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i14;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i7;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i8;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i9;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i10;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i11;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i2;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i6;
import 'package:municipium/ui/pages/splash_page.dart' as _i12;
import 'package:municipium/ui/pages/submenu_page.dart' as _i13;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    CoreMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<CoreMunicipalityRouteArgs>(
          orElse: () => const CoreMunicipalityRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i15.WrappedRoute(child: _i1.CoreMunicipalityPage(key: args.key)),
      );
    },
    DetailPoiRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPoiRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i2.DetailPoiPage(
          key: args.key,
          poiId: args.poiId,
        )),
      );
    },
    EventListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i3.EventListPage()),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(key: args.key),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i5.MainPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    MapsRoute.name: (routeData) {
      final args = routeData.argsAs<MapsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i6.MapsPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        )),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i7.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i8.NewsListPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnboardingPage(),
      );
    },
    OnboardingSearchMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i10.OnboardingSearchMunicipalityPage(key: args.key)),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i11.PointOfInterestListPage()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashPage(),
      );
    },
    SubMenuRoute.name: (routeData) {
      final args = routeData.argsAs<SubMenuRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SubMenuPage(
          key: args.key,
          menu: args.menu,
          item: args.item,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i14.WelcomePage(
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
    extends _i15.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static const _i15.PageInfo<CoreMunicipalityRouteArgs> page =
      _i15.PageInfo<CoreMunicipalityRouteArgs>(name);
}

class CoreMunicipalityRouteArgs {
  const CoreMunicipalityRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DetailPoiPage]
class DetailPoiRoute extends _i15.PageRouteInfo<DetailPoiRouteArgs> {
  DetailPoiRoute({
    _i16.Key? key,
    required int poiId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          DetailPoiRoute.name,
          args: DetailPoiRouteArgs(
            key: key,
            poiId: poiId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPoiRoute';

  static const _i15.PageInfo<DetailPoiRouteArgs> page =
      _i15.PageInfo<DetailPoiRouteArgs>(name);
}

class DetailPoiRouteArgs {
  const DetailPoiRouteArgs({
    this.key,
    required this.poiId,
  });

  final _i16.Key? key;

  final int poiId;

  @override
  String toString() {
    return 'DetailPoiRouteArgs{key: $key, poiId: $poiId}';
  }
}

/// generated route for
/// [_i3.EventListPage]
class EventListRoute extends _i15.PageRouteInfo<void> {
  const EventListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i15.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<HomeRouteArgs> page =
      _i15.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i15.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i17.Key? key,
    required int municipalityId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i15.PageInfo<MainRouteArgs> page =
      _i15.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i17.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i6.MapsPage]
class MapsRoute extends _i15.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    _i16.Key? key,
    required _i16.GlobalKey<_i17.ScaffoldState> scaffoldKey,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const _i15.PageInfo<MapsRouteArgs> page =
      _i15.PageInfo<MapsRouteArgs>(name);
}

class MapsRouteArgs {
  const MapsRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i16.Key? key;

  final _i16.GlobalKey<_i17.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i7.NewsDetailPage]
class NewsDetailRoute extends _i15.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i17.Key? key,
    required int newsId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i15.PageInfo<NewsDetailRouteArgs> page =
      _i15.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i17.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i8.NewsListPage]
class NewsListRoute extends _i15.PageRouteInfo<void> {
  const NewsListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnboardingPage]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i15.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static const _i15.PageInfo<OnboardingSearchMunicipalityRouteArgs> page =
      _i15.PageInfo<OnboardingSearchMunicipalityRouteArgs>(name);
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.PointOfInterestListPage]
class PointOfInterestListRoute extends _i15.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SubMenuPage]
class SubMenuRoute extends _i15.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i17.Key? key,
    required _i18.SubMenuType menu,
    required _i19.MenuItem item,
    List<_i15.PageRouteInfo>? children,
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

  static const _i15.PageInfo<SubMenuRouteArgs> page =
      _i15.PageInfo<SubMenuRouteArgs>(name);
}

class SubMenuRouteArgs {
  const SubMenuRouteArgs({
    this.key,
    required this.menu,
    required this.item,
  });

  final _i17.Key? key;

  final _i18.SubMenuType menu;

  final _i19.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i14.WelcomePage]
class WelcomeRoute extends _i15.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i16.Key? key,
    required int municipalityId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i15.PageInfo<WelcomeRouteArgs> page =
      _i15.PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i16.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
