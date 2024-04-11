// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i11;
import 'package:flutter/material.dart' as _i10;
import 'package:municipium/ui/pages/main_page.dart' as _i1;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i8;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i2;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i3;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i4;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i5;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i6;
import 'package:municipium/ui/pages/splash_page.dart' as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i1.MainPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i2.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i3.NewsListPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnboardingPage(),
      );
    },
    OnboardingSearchMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i5.OnboardingSearchMunicipalityPage(key: args.key)),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i6.PointOfInterestListPage()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i8.WelcomePage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i9.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i10.Key? key,
    required int municipalityId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i9.PageInfo<MainRouteArgs> page =
      _i9.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i10.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i2.NewsDetailPage]
class NewsDetailRoute extends _i9.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i10.Key? key,
    required int newsId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i9.PageInfo<NewsDetailRouteArgs> page =
      _i9.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i10.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i3.NewsListPage]
class NewsListRoute extends _i9.PageRouteInfo<void> {
  const NewsListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i9.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static const _i9.PageInfo<OnboardingSearchMunicipalityRouteArgs> page =
      _i9.PageInfo<OnboardingSearchMunicipalityRouteArgs>(name);
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.PointOfInterestListPage]
class PointOfInterestListRoute extends _i9.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.WelcomePage]
class WelcomeRoute extends _i9.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i11.Key? key,
    required int municipalityId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i9.PageInfo<WelcomeRouteArgs> page =
      _i9.PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i11.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
