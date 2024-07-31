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
import 'package:municipium/services/network/dto/issue_detail_dto.dart' as _i34;
import 'package:municipium/ui/pages/events_section/event_detail_page.dart'
    as _i5;
import 'package:municipium/ui/pages/events_section/event_list_page.dart' as _i6;
import 'package:municipium/ui/pages/issues_section/chat_message_page.dart'
    as _i1;
import 'package:municipium/ui/pages/issues_section/issue_detail_page.dart'
    as _i8;
import 'package:municipium/ui/pages/issues_section/issues_list_page.dart'
    as _i9;
import 'package:municipium/ui/pages/issues_section/new_issue_pager.dart'
    as _i12;
import 'package:municipium/ui/pages/issues_section/newissue_completed_page.dart'
    as _i14;
import 'package:municipium/ui/pages/main_page.dart' as _i10;
import 'package:municipium/ui/pages/municipality_section/choose_municipality_page.dart'
    as _i2;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i3;
import 'package:municipium/ui/pages/municipality_section/home_page.dart' as _i7;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i31;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i15;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i16;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i17;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i18;
import 'package:municipium/ui/pages/payment_section/new_self_payment_pager.dart'
    as _i13;
import 'package:municipium/ui/pages/payment_section/payment_choice_page.dart'
    as _i19;
import 'package:municipium/ui/pages/payment_section/person_type_payment_page.dart'
    as _i20;
import 'package:municipium/ui/pages/payment_section/self_payments_page.dart'
    as _i26;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_page.dart'
    as _i21;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_webview.dart'
    as _i22;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_services_page.dart'
    as _i23;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i24;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i4;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i11;
import 'package:municipium/ui/pages/reservations_section/reservations_pager.dart'
    as _i25;
import 'package:municipium/ui/pages/settings_section/settings_page.dart'
    as _i27;
import 'package:municipium/ui/pages/splash_page.dart' as _i28;
import 'package:municipium/ui/pages/submenu_page.dart' as _i29;
import 'package:municipium/ui/pages/user_configuration_section/user_conf_menu_edit_page.dart'
    as _i30;

abstract class $AppRouter extends _i32.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    ChatMessageRoute.name: (routeData) {
      final args = routeData.argsAs<ChatMessageRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i1.ChatMessagePage(
          key: args.key,
          messages: args.messages,
          title: args.title,
          issueId: args.issueId,
          municName: args.municName,
        )),
      );
    },
    ChooseMunicipalityRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i2.ChooseMunicipalityPage()),
      );
    },
    CoreMunicipalityRoute.name: (routeData) {
      final args = routeData.argsAs<CoreMunicipalityRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i3.CoreMunicipalityPage(
          key: args.key,
          municipalityId: args.municipalityId,
        )),
      );
    },
    DetailPoiRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPoiRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i4.DetailPoiPage(
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
            child: _i5.EventDetailPage(
          key: args.key,
          eventId: args.eventId,
        )),
      );
    },
    EventListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i6.EventListPage()),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HomePage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    IssueDetailRoute.name: (routeData) {
      final args = routeData.argsAs<IssueDetailRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i8.IssueDetailPage(
          key: args.key,
          id: args.id,
          udid: args.udid,
        )),
      );
    },
    IssuesListRoute.name: (routeData) {
      final args = routeData.argsAs<IssuesListRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i9.IssuesListPage(
          key: args.key,
          udid: args.udid,
        )),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i10.MainPage(
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
            child: _i11.MapsPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        )),
      );
    },
    NewIssueRouter.name: (routeData) {
      final args = routeData.argsAs<NewIssueRouterArgs>(
          orElse: () => const NewIssueRouterArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: _i12.NewIssuePager(key: args.key)),
      );
    },
    NewSelfPaymentRouter.name: (routeData) {
      final args = routeData.argsAs<NewSelfPaymentRouterArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i13.NewSelfPaymentPager(
          key: args.key,
          baseUrl: args.baseUrl,
          ente: args.ente,
          codice: args.codice,
        )),
      );
    },
    NewissueCompletedRoute.name: (routeData) {
      final args = routeData.argsAs<NewissueCompletedRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.NewissueCompletedPage(
          key: args.key,
          udid: args.udid,
        ),
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
    PaymentChoiceRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PaymentChoicePage(),
      );
    },
    PersonTypePaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PersonTypePaymentRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i20.PersonTypePaymentPage(
          key: args.key,
          baseUrl: args.baseUrl,
          ente: args.ente,
          codice: args.codice,
        )),
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
    PnrrDetailWebviewRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrDetailWebviewRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.PnrrDetailWebviewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    PnrrServicesRoute.name: (routeData) {
      final args = routeData.argsAs<PnrrServicesRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i23.PnrrServicesPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    PointOfInterestListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i24.PointOfInterestListPage()),
      );
    },
    ReservationsRouter.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i25.ReservationsPager()),
      );
    },
    SelfPaymentsRoute.name: (routeData) {
      final args = routeData.argsAs<SelfPaymentsRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i26.SelfPaymentsPage(
          key: args.key,
          baseUrl: args.baseUrl,
          ente: args.ente,
        )),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SplashPage(),
      );
    },
    SubMenuRoute.name: (routeData) {
      final args = routeData.argsAs<SubMenuRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.SubMenuPage(
          key: args.key,
          menu: args.menu,
          item: args.item,
        ),
      );
    },
    UserConfMenuEditRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.UserConfMenuEditPage(),
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
/// [_i1.ChatMessagePage]
class ChatMessageRoute extends _i32.PageRouteInfo<ChatMessageRouteArgs> {
  ChatMessageRoute({
    _i33.Key? key,
    required List<_i34.IssueChatItem> messages,
    required String title,
    required int issueId,
    required String municName,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ChatMessageRoute.name,
          args: ChatMessageRouteArgs(
            key: key,
            messages: messages,
            title: title,
            issueId: issueId,
            municName: municName,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatMessageRoute';

  static const _i32.PageInfo<ChatMessageRouteArgs> page =
      _i32.PageInfo<ChatMessageRouteArgs>(name);
}

class ChatMessageRouteArgs {
  const ChatMessageRouteArgs({
    this.key,
    required this.messages,
    required this.title,
    required this.issueId,
    required this.municName,
  });

  final _i33.Key? key;

  final List<_i34.IssueChatItem> messages;

  final String title;

  final int issueId;

  final String municName;

  @override
  String toString() {
    return 'ChatMessageRouteArgs{key: $key, messages: $messages, title: $title, issueId: $issueId, municName: $municName}';
  }
}

/// generated route for
/// [_i2.ChooseMunicipalityPage]
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
/// [_i3.CoreMunicipalityPage]
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
/// [_i4.DetailPoiPage]
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
/// [_i5.EventDetailPage]
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
/// [_i6.EventListPage]
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
/// [_i7.HomePage]
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
/// [_i8.IssueDetailPage]
class IssueDetailRoute extends _i32.PageRouteInfo<IssueDetailRouteArgs> {
  IssueDetailRoute({
    _i33.Key? key,
    required int id,
    required String udid,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<IssueDetailRouteArgs> page =
      _i32.PageInfo<IssueDetailRouteArgs>(name);
}

class IssueDetailRouteArgs {
  const IssueDetailRouteArgs({
    this.key,
    required this.id,
    required this.udid,
  });

  final _i33.Key? key;

  final int id;

  final String udid;

  @override
  String toString() {
    return 'IssueDetailRouteArgs{key: $key, id: $id, udid: $udid}';
  }
}

/// generated route for
/// [_i9.IssuesListPage]
class IssuesListRoute extends _i32.PageRouteInfo<IssuesListRouteArgs> {
  IssuesListRoute({
    _i33.Key? key,
    required String udid,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          IssuesListRoute.name,
          args: IssuesListRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'IssuesListRoute';

  static const _i32.PageInfo<IssuesListRouteArgs> page =
      _i32.PageInfo<IssuesListRouteArgs>(name);
}

class IssuesListRouteArgs {
  const IssuesListRouteArgs({
    this.key,
    required this.udid,
  });

  final _i33.Key? key;

  final String udid;

  @override
  String toString() {
    return 'IssuesListRouteArgs{key: $key, udid: $udid}';
  }
}

/// generated route for
/// [_i10.MainPage]
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
/// [_i11.MapsPage]
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
/// [_i12.NewIssuePager]
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
/// [_i13.NewSelfPaymentPager]
class NewSelfPaymentRouter
    extends _i32.PageRouteInfo<NewSelfPaymentRouterArgs> {
  NewSelfPaymentRouter({
    _i33.Key? key,
    required String baseUrl,
    required String ente,
    required String codice,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          NewSelfPaymentRouter.name,
          args: NewSelfPaymentRouterArgs(
            key: key,
            baseUrl: baseUrl,
            ente: ente,
            codice: codice,
          ),
          initialChildren: children,
        );

  static const String name = 'NewSelfPaymentRouter';

  static const _i32.PageInfo<NewSelfPaymentRouterArgs> page =
      _i32.PageInfo<NewSelfPaymentRouterArgs>(name);
}

class NewSelfPaymentRouterArgs {
  const NewSelfPaymentRouterArgs({
    this.key,
    required this.baseUrl,
    required this.ente,
    required this.codice,
  });

  final _i33.Key? key;

  final String baseUrl;

  final String ente;

  final String codice;

  @override
  String toString() {
    return 'NewSelfPaymentRouterArgs{key: $key, baseUrl: $baseUrl, ente: $ente, codice: $codice}';
  }
}

/// generated route for
/// [_i14.NewissueCompletedPage]
class NewissueCompletedRoute
    extends _i32.PageRouteInfo<NewissueCompletedRouteArgs> {
  NewissueCompletedRoute({
    _i33.Key? key,
    required String udid,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          NewissueCompletedRoute.name,
          args: NewissueCompletedRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'NewissueCompletedRoute';

  static const _i32.PageInfo<NewissueCompletedRouteArgs> page =
      _i32.PageInfo<NewissueCompletedRouteArgs>(name);
}

class NewissueCompletedRouteArgs {
  const NewissueCompletedRouteArgs({
    this.key,
    required this.udid,
  });

  final _i33.Key? key;

  final String udid;

  @override
  String toString() {
    return 'NewissueCompletedRouteArgs{key: $key, udid: $udid}';
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
/// [_i19.PaymentChoicePage]
class PaymentChoiceRoute extends _i32.PageRouteInfo<void> {
  const PaymentChoiceRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PaymentChoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentChoiceRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PersonTypePaymentPage]
class PersonTypePaymentRoute
    extends _i32.PageRouteInfo<PersonTypePaymentRouteArgs> {
  PersonTypePaymentRoute({
    _i33.Key? key,
    required String baseUrl,
    required String ente,
    required String codice,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          PersonTypePaymentRoute.name,
          args: PersonTypePaymentRouteArgs(
            key: key,
            baseUrl: baseUrl,
            ente: ente,
            codice: codice,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonTypePaymentRoute';

  static const _i32.PageInfo<PersonTypePaymentRouteArgs> page =
      _i32.PageInfo<PersonTypePaymentRouteArgs>(name);
}

class PersonTypePaymentRouteArgs {
  const PersonTypePaymentRouteArgs({
    this.key,
    required this.baseUrl,
    required this.ente,
    required this.codice,
  });

  final _i33.Key? key;

  final String baseUrl;

  final String ente;

  final String codice;

  @override
  String toString() {
    return 'PersonTypePaymentRouteArgs{key: $key, baseUrl: $baseUrl, ente: $ente, codice: $codice}';
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
/// [_i22.PnrrDetailWebviewPage]
class PnrrDetailWebviewRoute
    extends _i32.PageRouteInfo<PnrrDetailWebviewRouteArgs> {
  PnrrDetailWebviewRoute({
    _i33.Key? key,
    required String url,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          PnrrDetailWebviewRoute.name,
          args: PnrrDetailWebviewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrDetailWebviewRoute';

  static const _i32.PageInfo<PnrrDetailWebviewRouteArgs> page =
      _i32.PageInfo<PnrrDetailWebviewRouteArgs>(name);
}

class PnrrDetailWebviewRouteArgs {
  const PnrrDetailWebviewRouteArgs({
    this.key,
    required this.url,
  });

  final _i33.Key? key;

  final String url;

  @override
  String toString() {
    return 'PnrrDetailWebviewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i23.PnrrServicesPage]
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
/// [_i24.PointOfInterestListPage]
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
/// [_i25.ReservationsPager]
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
/// [_i26.SelfPaymentsPage]
class SelfPaymentsRoute extends _i32.PageRouteInfo<SelfPaymentsRouteArgs> {
  SelfPaymentsRoute({
    _i33.Key? key,
    required String baseUrl,
    required String ente,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          SelfPaymentsRoute.name,
          args: SelfPaymentsRouteArgs(
            key: key,
            baseUrl: baseUrl,
            ente: ente,
          ),
          initialChildren: children,
        );

  static const String name = 'SelfPaymentsRoute';

  static const _i32.PageInfo<SelfPaymentsRouteArgs> page =
      _i32.PageInfo<SelfPaymentsRouteArgs>(name);
}

class SelfPaymentsRouteArgs {
  const SelfPaymentsRouteArgs({
    this.key,
    required this.baseUrl,
    required this.ente,
  });

  final _i33.Key? key;

  final String baseUrl;

  final String ente;

  @override
  String toString() {
    return 'SelfPaymentsRouteArgs{key: $key, baseUrl: $baseUrl, ente: $ente}';
  }
}

/// generated route for
/// [_i27.SettingsPage]
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
/// [_i28.SplashPage]
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
/// [_i29.SubMenuPage]
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
/// [_i30.UserConfMenuEditPage]
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
