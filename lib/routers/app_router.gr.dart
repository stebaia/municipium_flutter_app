// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:municipium/model/menu/menu_item.dart' as _i16;
import 'package:municipium/model/menu/submenu_type.dart' as _i15;
import 'package:municipium/ui/pages/main_page.dart' as _i3;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i1;
import 'package:municipium/ui/pages/municipality_section/home_page.dart' as _i2;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i11;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i4;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i5;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i6;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i7;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i8;
import 'package:municipium/ui/pages/splash_page.dart' as _i9;
import 'package:municipium/ui/pages/submenu_page.dart' as _i10;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CoreMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<CoreMunicipalityRouteArgs>(
          orElse: () => const CoreMunicipalityRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i12.WrappedRoute(child: _i1.CoreMunicipalityPage(key: args.key)),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i3.MainPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i4.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i5.NewsListPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnboardingPage(),
      );
    },
    OnboardingSearchMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i7.OnboardingSearchMunicipalityPage(key: args.key)),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i8.PointOfInterestListPage()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashPage(),
      );
    },
    SubMenuRoute.name: (routeData) {
      final args = routeData.argsAs<SubMenuRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SubMenuPage(
          key: args.key,
          menu: args.menu,
          item: args.item,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i11.WelcomePage(
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
    extends _i12.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static const _i12.PageInfo<CoreMunicipalityRouteArgs> page =
      _i12.PageInfo<CoreMunicipalityRouteArgs>(name);
}

class CoreMunicipalityRouteArgs {
  const CoreMunicipalityRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i12.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i14.Key? key,
    required int municipalityId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i12.PageInfo<MainRouteArgs> page =
      _i12.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i14.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i4.NewsDetailPage]
class NewsDetailRoute extends _i12.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i14.Key? key,
    required int newsId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i12.PageInfo<NewsDetailRouteArgs> page =
      _i12.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i14.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i5.NewsListPage]
class NewsListRoute extends _i12.PageRouteInfo<void> {
  const NewsListRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i12.PageRouteInfo<void> {
  const OnboardingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i12.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static const _i12.PageInfo<OnboardingSearchMunicipalityRouteArgs> page =
      _i12.PageInfo<OnboardingSearchMunicipalityRouteArgs>(name);
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.PointOfInterestListPage]
class PointOfInterestListRoute extends _i12.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i12.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SubMenuPage]
class SubMenuRoute extends _i12.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i14.Key? key,
    required _i15.SubMenuType menu,
    required _i16.MenuItem item,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<SubMenuRouteArgs> page =
      _i12.PageInfo<SubMenuRouteArgs>(name);
}

class SubMenuRouteArgs {
  const SubMenuRouteArgs({
    this.key,
    required this.menu,
    required this.item,
  });

  final _i14.Key? key;

  final _i15.SubMenuType menu;

  final _i16.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i11.WelcomePage]
class WelcomeRoute extends _i12.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i13.Key? key,
    required int municipalityId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i12.PageInfo<WelcomeRouteArgs> page =
      _i12.PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i13.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
