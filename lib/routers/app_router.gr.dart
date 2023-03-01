// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:municipium/ui/pages/main_page.dart' as _i2;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i4;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i3;
import 'package:municipium/ui/pages/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.MainPage()),
      );
    },
    NewsListRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i3.NewsListPage()),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(
            child: _i4.NewsDetailPage(
          key: args.key,
          newsId: args.newsId,
        )),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
        _i5.RouteConfig(
          NewsListRoute.name,
          path: '/news-list-page',
        ),
        _i5.RouteConfig(
          NewsDetailRoute.name,
          path: '/news-detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-page',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.NewsListPage]
class NewsListRoute extends _i5.PageRouteInfo<void> {
  const NewsListRoute()
      : super(
          NewsListRoute.name,
          path: '/news-list-page',
        );

  static const String name = 'NewsListRoute';
}

/// generated route for
/// [_i4.NewsDetailPage]
class NewsDetailRoute extends _i5.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i6.Key? key,
    required int newsId,
  }) : super(
          NewsDetailRoute.name,
          path: '/news-detail-page',
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
        );

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i6.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}
