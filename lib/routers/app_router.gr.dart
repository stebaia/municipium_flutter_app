// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i49;
import 'package:flutter/cupertino.dart' as _i52;
import 'package:flutter/material.dart' as _i50;
import 'package:municipium/model/civil_defence/civil_defence_are_you_ready.dart'
    as _i54;
import 'package:municipium/model/menu/menu_item.dart' as _i56;
import 'package:municipium/model/menu/submenu_type.dart' as _i55;
import 'package:municipium/model/user/user_spid_model.dart' as _i51;
import 'package:municipium/services/network/dto/issue_detail_dto.dart' as _i53;
import 'package:municipium/ui/pages/calendar_section/calendar_page.dart' as _i3;
import 'package:municipium/ui/pages/civil_defence_section/civil_defence_are_you_ready_detail_page.dart'
    as _i6;
import 'package:municipium/ui/pages/civil_defence_section/civil_defence_are_you_ready_page.dart'
    as _i7;
import 'package:municipium/ui/pages/civil_defence_section/civil_defence_informations_page.dart'
    as _i8;
import 'package:municipium/ui/pages/civil_defence_section/civil_defence_level_page.dart'
    as _i9;
import 'package:municipium/ui/pages/civil_defence_section/civil_defence_news.page.dart'
    as _i10;
import 'package:municipium/ui/pages/civil_defence_section/civil_defence_numbers_page.dart'
    as _i11;
import 'package:municipium/ui/pages/events_section/event_detail_page.dart'
    as _i14;
import 'package:municipium/ui/pages/events_section/event_list_page.dart'
    as _i15;
import 'package:municipium/ui/pages/garbage_section/garbage_calendar_page.dart'
    as _i16;
import 'package:municipium/ui/pages/issues_section/chat_message_page.dart'
    as _i4;
import 'package:municipium/ui/pages/issues_section/issue_detail_page.dart'
    as _i18;
import 'package:municipium/ui/pages/issues_section/issues_list_page.dart'
    as _i19;
import 'package:municipium/ui/pages/issues_section/new_issue_pager.dart'
    as _i24;
import 'package:municipium/ui/pages/issues_section/newissue_completed_page.dart'
    as _i26;
import 'package:municipium/ui/pages/main_page.dart' as _i21;
import 'package:municipium/ui/pages/municipality_section/choose_municipality_page.dart'
    as _i5;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i12;
import 'package:municipium/ui/pages/municipality_section/home_page.dart'
    as _i17;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i48;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i27;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i28;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i29;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i30;
import 'package:municipium/ui/pages/online_service_detail_webview.dart' as _i31;
import 'package:municipium/ui/pages/payment_section/new_self_payment_pager.dart'
    as _i25;
import 'package:municipium/ui/pages/payment_section/payment_choice_page.dart'
    as _i32;
import 'package:municipium/ui/pages/payment_section/person_type_payment_page.dart'
    as _i33;
import 'package:municipium/ui/pages/payment_section/self_payments_page.dart'
    as _i40;
import 'package:municipium/ui/pages/personal_area_section/account_data_page.dart'
    as _i1;
import 'package:municipium/ui/pages/personal_area_section/account_preferece_page.dart'
    as _i2;
import 'package:municipium/ui/pages/personal_area_section/confirm_auth_spid_page.dart'
    as _i23;
import 'package:municipium/ui/pages/personal_area_section/login_spid_idp_list_page.dart'
    as _i20;
import 'package:municipium/ui/pages/personal_area_section/personal_area_menu_page.dart'
    as _i34;
import 'package:municipium/ui/pages/personal_area_section/webview_spid_auth_page.dart'
    as _i47;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_page.dart'
    as _i35;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_services_page.dart'
    as _i36;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i37;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i13;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i22;
import 'package:municipium/ui/pages/prenotations_section/prenotation_page.dart'
    as _i38;
import 'package:municipium/ui/pages/reservations_section/reservations_pager.dart'
    as _i39;
import 'package:municipium/ui/pages/service_online_section/service_online_list_page.dart'
    as _i41;
import 'package:municipium/ui/pages/settings_section/settings_page.dart'
    as _i42;
import 'package:municipium/ui/pages/splash_page.dart' as _i43;
import 'package:municipium/ui/pages/submenu_page.dart' as _i44;
import 'package:municipium/ui/pages/user_configuration_section/user_conf_menu_edit_page.dart'
    as _i45;
import 'package:municipium/ui/pages/weather_section/weather_quality_page.dart'
    as _i46;

/// generated route for
/// [_i1.AccountDataPage]
class AccountDataRoute extends _i49.PageRouteInfo<AccountDataRouteArgs> {
  AccountDataRoute({
    _i50.Key? key,
    required _i51.SpidUserModel userModel,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          AccountDataRoute.name,
          args: AccountDataRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountDataRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AccountDataRouteArgs>();
      return _i1.AccountDataPage(
        key: args.key,
        userModel: args.userModel,
      );
    },
  );
}

class AccountDataRouteArgs {
  const AccountDataRouteArgs({
    this.key,
    required this.userModel,
  });

  final _i50.Key? key;

  final _i51.SpidUserModel userModel;

  @override
  String toString() {
    return 'AccountDataRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [_i2.AccountPreferecePage]
class AccountPrefereceRoute extends _i49.PageRouteInfo<void> {
  const AccountPrefereceRoute({List<_i49.PageRouteInfo>? children})
      : super(
          AccountPrefereceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountPrefereceRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountPreferecePage();
    },
  );
}

/// generated route for
/// [_i3.CalendarPage]
class CalendarRoute extends _i49.PageRouteInfo<CalendarRouteArgs> {
  CalendarRoute({
    _i52.Key? key,
    required _i52.GlobalKey<_i50.ScaffoldState> scaffoldKey,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          CalendarRoute.name,
          args: CalendarRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CalendarRouteArgs>();
      return _i49.WrappedRoute(
          child: _i3.CalendarPage(
        key: args.key,
        scaffoldKey: args.scaffoldKey,
      ));
    },
  );
}

class CalendarRouteArgs {
  const CalendarRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i52.Key? key;

  final _i52.GlobalKey<_i50.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'CalendarRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i4.ChatMessagePage]
class ChatMessageRoute extends _i49.PageRouteInfo<ChatMessageRouteArgs> {
  ChatMessageRoute({
    _i50.Key? key,
    required List<_i53.IssueChatItem> messages,
    required String title,
    required int issueId,
    required String municName,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatMessageRouteArgs>();
      return _i49.WrappedRoute(
          child: _i4.ChatMessagePage(
        key: args.key,
        messages: args.messages,
        title: args.title,
        issueId: args.issueId,
        municName: args.municName,
      ));
    },
  );
}

class ChatMessageRouteArgs {
  const ChatMessageRouteArgs({
    this.key,
    required this.messages,
    required this.title,
    required this.issueId,
    required this.municName,
  });

  final _i50.Key? key;

  final List<_i53.IssueChatItem> messages;

  final String title;

  final int issueId;

  final String municName;

  @override
  String toString() {
    return 'ChatMessageRouteArgs{key: $key, messages: $messages, title: $title, issueId: $issueId, municName: $municName}';
  }
}

/// generated route for
/// [_i5.ChooseMunicipalityPage]
class ChooseMunicipalityRoute
    extends _i49.PageRouteInfo<ChooseMunicipalityRouteArgs> {
  ChooseMunicipalityRoute({
    _i52.Key? key,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          ChooseMunicipalityRoute.name,
          args: ChooseMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChooseMunicipalityRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChooseMunicipalityRouteArgs>(
          orElse: () => const ChooseMunicipalityRouteArgs());
      return _i49.WrappedRoute(
          child: _i5.ChooseMunicipalityPage(key: args.key));
    },
  );
}

class ChooseMunicipalityRouteArgs {
  const ChooseMunicipalityRouteArgs({this.key});

  final _i52.Key? key;

  @override
  String toString() {
    return 'ChooseMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.CivilDefenceAreYouReadyDetailPage]
class CivilDefenceAreYouReadyDetailRoute
    extends _i49.PageRouteInfo<CivilDefenceAreYouReadyDetailRouteArgs> {
  CivilDefenceAreYouReadyDetailRoute({
    _i50.Key? key,
    required _i54.CivilDefenceAreYouReady element,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          CivilDefenceAreYouReadyDetailRoute.name,
          args: CivilDefenceAreYouReadyDetailRouteArgs(
            key: key,
            element: element,
          ),
          initialChildren: children,
        );

  static const String name = 'CivilDefenceAreYouReadyDetailRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CivilDefenceAreYouReadyDetailRouteArgs>();
      return _i6.CivilDefenceAreYouReadyDetailPage(
        key: args.key,
        element: args.element,
      );
    },
  );
}

class CivilDefenceAreYouReadyDetailRouteArgs {
  const CivilDefenceAreYouReadyDetailRouteArgs({
    this.key,
    required this.element,
  });

  final _i50.Key? key;

  final _i54.CivilDefenceAreYouReady element;

  @override
  String toString() {
    return 'CivilDefenceAreYouReadyDetailRouteArgs{key: $key, element: $element}';
  }
}

/// generated route for
/// [_i7.CivilDefenceAreYouReadyPage]
class CivilDefenceAreYouReadyRoute extends _i49.PageRouteInfo<void> {
  const CivilDefenceAreYouReadyRoute({List<_i49.PageRouteInfo>? children})
      : super(
          CivilDefenceAreYouReadyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceAreYouReadyRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i7.CivilDefenceAreYouReadyPage());
    },
  );
}

/// generated route for
/// [_i8.CivilDefenceInformationsPage]
class CivilDefenceInformationsRoute extends _i49.PageRouteInfo<void> {
  const CivilDefenceInformationsRoute({List<_i49.PageRouteInfo>? children})
      : super(
          CivilDefenceInformationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceInformationsRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i8.CivilDefenceInformationsPage());
    },
  );
}

/// generated route for
/// [_i9.CivilDefenceLevelPage]
class CivilDefenceLevelRoute extends _i49.PageRouteInfo<void> {
  const CivilDefenceLevelRoute({List<_i49.PageRouteInfo>? children})
      : super(
          CivilDefenceLevelRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceLevelRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i9.CivilDefenceLevelPage());
    },
  );
}

/// generated route for
/// [_i10.CivilDefenceNewsPage]
class CivilDefenceNewsRoute extends _i49.PageRouteInfo<void> {
  const CivilDefenceNewsRoute({List<_i49.PageRouteInfo>? children})
      : super(
          CivilDefenceNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceNewsRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i10.CivilDefenceNewsPage());
    },
  );
}

/// generated route for
/// [_i11.CivilDefenceNumbersPage]
class CivilDefenceNumbersRoute extends _i49.PageRouteInfo<void> {
  const CivilDefenceNumbersRoute({List<_i49.PageRouteInfo>? children})
      : super(
          CivilDefenceNumbersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceNumbersRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i11.CivilDefenceNumbersPage());
    },
  );
}

/// generated route for
/// [_i12.CoreMunicipalityPage]
class CoreMunicipalityRoute
    extends _i49.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i52.Key? key,
    required int municipalityId,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CoreMunicipalityRouteArgs>();
      return _i12.CoreMunicipalityPage(
        key: args.key,
        municipalityId: args.municipalityId,
      );
    },
  );
}

class CoreMunicipalityRouteArgs {
  const CoreMunicipalityRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i52.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i13.DetailPoiPage]
class DetailPoiRoute extends _i49.PageRouteInfo<DetailPoiRouteArgs> {
  DetailPoiRoute({
    _i52.Key? key,
    required int poiId,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          DetailPoiRoute.name,
          args: DetailPoiRouteArgs(
            key: key,
            poiId: poiId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPoiRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailPoiRouteArgs>();
      return _i49.WrappedRoute(
          child: _i13.DetailPoiPage(
        key: args.key,
        poiId: args.poiId,
      ));
    },
  );
}

class DetailPoiRouteArgs {
  const DetailPoiRouteArgs({
    this.key,
    required this.poiId,
  });

  final _i52.Key? key;

  final int poiId;

  @override
  String toString() {
    return 'DetailPoiRouteArgs{key: $key, poiId: $poiId}';
  }
}

/// generated route for
/// [_i14.EventDetailPage]
class EventDetailRoute extends _i49.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i50.Key? key,
    required int eventId,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailRouteArgs>();
      return _i49.WrappedRoute(
          child: _i14.EventDetailPage(
        key: args.key,
        eventId: args.eventId,
      ));
    },
  );
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.eventId,
  });

  final _i50.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i15.EventListPage]
class EventListRoute extends _i49.PageRouteInfo<void> {
  const EventListRoute({List<_i49.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i15.EventListPage());
    },
  );
}

/// generated route for
/// [_i16.GarbageCalendarPage]
class GarbageCalendarRoute extends _i49.PageRouteInfo<void> {
  const GarbageCalendarRoute({List<_i49.PageRouteInfo>? children})
      : super(
          GarbageCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'GarbageCalendarRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i16.GarbageCalendarPage());
    },
  );
}

/// generated route for
/// [_i17.HomePage]
class HomeRoute extends _i49.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i50.Key? key,
    required _i50.GlobalKey<_i50.ScaffoldState> scaffoldKey,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i17.HomePage(
        key: args.key,
        scaffoldKey: args.scaffoldKey,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i50.Key? key;

  final _i50.GlobalKey<_i50.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i18.IssueDetailPage]
class IssueDetailRoute extends _i49.PageRouteInfo<IssueDetailRouteArgs> {
  IssueDetailRoute({
    _i50.Key? key,
    required int id,
    required String udid,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<IssueDetailRouteArgs>();
      return _i49.WrappedRoute(
          child: _i18.IssueDetailPage(
        key: args.key,
        id: args.id,
        udid: args.udid,
      ));
    },
  );
}

class IssueDetailRouteArgs {
  const IssueDetailRouteArgs({
    this.key,
    required this.id,
    required this.udid,
  });

  final _i50.Key? key;

  final int id;

  final String udid;

  @override
  String toString() {
    return 'IssueDetailRouteArgs{key: $key, id: $id, udid: $udid}';
  }
}

/// generated route for
/// [_i19.IssuesListPage]
class IssuesListRoute extends _i49.PageRouteInfo<IssuesListRouteArgs> {
  IssuesListRoute({
    _i50.Key? key,
    required String udid,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          IssuesListRoute.name,
          args: IssuesListRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'IssuesListRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<IssuesListRouteArgs>();
      return _i49.WrappedRoute(
          child: _i19.IssuesListPage(
        key: args.key,
        udid: args.udid,
      ));
    },
  );
}

class IssuesListRouteArgs {
  const IssuesListRouteArgs({
    this.key,
    required this.udid,
  });

  final _i50.Key? key;

  final String udid;

  @override
  String toString() {
    return 'IssuesListRouteArgs{key: $key, udid: $udid}';
  }
}

/// generated route for
/// [_i20.LoginSpidIdpListPage]
class LoginSpidIdpListRoute extends _i49.PageRouteInfo<void> {
  const LoginSpidIdpListRoute({List<_i49.PageRouteInfo>? children})
      : super(
          LoginSpidIdpListRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginSpidIdpListRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i20.LoginSpidIdpListPage());
    },
  );
}

/// generated route for
/// [_i21.MainPage]
class MainRoute extends _i49.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i50.Key? key,
    required int municipalityId,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>();
      return _i49.WrappedRoute(
          child: _i21.MainPage(
        key: args.key,
        municipalityId: args.municipalityId,
      ));
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i50.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i22.MapsPage]
class MapsRoute extends _i49.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    _i52.Key? key,
    required _i52.GlobalKey<_i50.ScaffoldState> scaffoldKey,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MapsRouteArgs>();
      return _i49.WrappedRoute(
          child: _i22.MapsPage(
        key: args.key,
        scaffoldKey: args.scaffoldKey,
      ));
    },
  );
}

class MapsRouteArgs {
  const MapsRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i52.Key? key;

  final _i52.GlobalKey<_i50.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i23.MyWidget]
class MyWidget extends _i49.PageRouteInfo<void> {
  const MyWidget({List<_i49.PageRouteInfo>? children})
      : super(
          MyWidget.name,
          initialChildren: children,
        );

  static const String name = 'MyWidget';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i23.MyWidget();
    },
  );
}

/// generated route for
/// [_i24.NewIssuePager]
class NewIssueRouter extends _i49.PageRouteInfo<NewIssueRouterArgs> {
  NewIssueRouter({
    _i52.Key? key,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          NewIssueRouter.name,
          args: NewIssueRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewIssueRouter';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewIssueRouterArgs>(
          orElse: () => const NewIssueRouterArgs());
      return _i49.WrappedRoute(child: _i24.NewIssuePager(key: args.key));
    },
  );
}

class NewIssueRouterArgs {
  const NewIssueRouterArgs({this.key});

  final _i52.Key? key;

  @override
  String toString() {
    return 'NewIssueRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.NewSelfPaymentPager]
class NewSelfPaymentRouter
    extends _i49.PageRouteInfo<NewSelfPaymentRouterArgs> {
  NewSelfPaymentRouter({
    _i50.Key? key,
    required String baseUrl,
    required String ente,
    required String codice,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewSelfPaymentRouterArgs>();
      return _i49.WrappedRoute(
          child: _i25.NewSelfPaymentPager(
        key: args.key,
        baseUrl: args.baseUrl,
        ente: args.ente,
        codice: args.codice,
      ));
    },
  );
}

class NewSelfPaymentRouterArgs {
  const NewSelfPaymentRouterArgs({
    this.key,
    required this.baseUrl,
    required this.ente,
    required this.codice,
  });

  final _i50.Key? key;

  final String baseUrl;

  final String ente;

  final String codice;

  @override
  String toString() {
    return 'NewSelfPaymentRouterArgs{key: $key, baseUrl: $baseUrl, ente: $ente, codice: $codice}';
  }
}

/// generated route for
/// [_i26.NewissueCompletedPage]
class NewissueCompletedRoute
    extends _i49.PageRouteInfo<NewissueCompletedRouteArgs> {
  NewissueCompletedRoute({
    _i50.Key? key,
    required String udid,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          NewissueCompletedRoute.name,
          args: NewissueCompletedRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'NewissueCompletedRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewissueCompletedRouteArgs>();
      return _i26.NewissueCompletedPage(
        key: args.key,
        udid: args.udid,
      );
    },
  );
}

class NewissueCompletedRouteArgs {
  const NewissueCompletedRouteArgs({
    this.key,
    required this.udid,
  });

  final _i50.Key? key;

  final String udid;

  @override
  String toString() {
    return 'NewissueCompletedRouteArgs{key: $key, udid: $udid}';
  }
}

/// generated route for
/// [_i27.NewsDetailPage]
class NewsDetailRoute extends _i49.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i50.Key? key,
    required int newsId,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsDetailRouteArgs>();
      return _i49.WrappedRoute(
          child: _i27.NewsDetailPage(
        key: args.key,
        newsId: args.newsId,
      ));
    },
  );
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i50.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i28.NewsListPage]
class NewsListRoute extends _i49.PageRouteInfo<void> {
  const NewsListRoute({List<_i49.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i28.NewsListPage());
    },
  );
}

/// generated route for
/// [_i29.OnboardingPage]
class OnboardingRoute extends _i49.PageRouteInfo<void> {
  const OnboardingRoute({List<_i49.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i29.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i30.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i49.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i52.Key? key,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i49.WrappedRoute(
          child: _i30.OnboardingSearchMunicipalityPage(key: args.key));
    },
  );
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i52.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i31.OnlineServiceDetailWebviewPage]
class OnlineServiceDetailWebviewRoute
    extends _i49.PageRouteInfo<OnlineServiceDetailWebviewRouteArgs> {
  OnlineServiceDetailWebviewRoute({
    _i50.Key? key,
    required String url,
    required String name,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnlineServiceDetailWebviewRouteArgs>();
      return _i31.OnlineServiceDetailWebviewPage(
        key: args.key,
        url: args.url,
        name: args.name,
      );
    },
  );
}

class OnlineServiceDetailWebviewRouteArgs {
  const OnlineServiceDetailWebviewRouteArgs({
    this.key,
    required this.url,
    required this.name,
  });

  final _i50.Key? key;

  final String url;

  final String name;

  @override
  String toString() {
    return 'OnlineServiceDetailWebviewRouteArgs{key: $key, url: $url, name: $name}';
  }
}

/// generated route for
/// [_i32.PaymentChoicePage]
class PaymentChoiceRoute extends _i49.PageRouteInfo<void> {
  const PaymentChoiceRoute({List<_i49.PageRouteInfo>? children})
      : super(
          PaymentChoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentChoiceRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i32.PaymentChoicePage();
    },
  );
}

/// generated route for
/// [_i33.PersonTypePaymentPage]
class PersonTypePaymentRoute
    extends _i49.PageRouteInfo<PersonTypePaymentRouteArgs> {
  PersonTypePaymentRoute({
    _i50.Key? key,
    required String baseUrl,
    required String ente,
    required String codice,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PersonTypePaymentRouteArgs>();
      return _i49.WrappedRoute(
          child: _i33.PersonTypePaymentPage(
        key: args.key,
        baseUrl: args.baseUrl,
        ente: args.ente,
        codice: args.codice,
      ));
    },
  );
}

class PersonTypePaymentRouteArgs {
  const PersonTypePaymentRouteArgs({
    this.key,
    required this.baseUrl,
    required this.ente,
    required this.codice,
  });

  final _i50.Key? key;

  final String baseUrl;

  final String ente;

  final String codice;

  @override
  String toString() {
    return 'PersonTypePaymentRouteArgs{key: $key, baseUrl: $baseUrl, ente: $ente, codice: $codice}';
  }
}

/// generated route for
/// [_i34.PersonalAreaMenuPage]
class PersonalAreaMenuRoute
    extends _i49.PageRouteInfo<PersonalAreaMenuRouteArgs> {
  PersonalAreaMenuRoute({
    _i52.Key? key,
    required _i52.GlobalKey<_i50.ScaffoldState> scaffoldKey,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          PersonalAreaMenuRoute.name,
          args: PersonalAreaMenuRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalAreaMenuRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PersonalAreaMenuRouteArgs>();
      return _i49.WrappedRoute(
          child: _i34.PersonalAreaMenuPage(
        key: args.key,
        scaffoldKey: args.scaffoldKey,
      ));
    },
  );
}

class PersonalAreaMenuRouteArgs {
  const PersonalAreaMenuRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i52.Key? key;

  final _i52.GlobalKey<_i50.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'PersonalAreaMenuRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i35.PnrrDetailPage]
class PnrrDetailRoute extends _i49.PageRouteInfo<PnrrDetailRouteArgs> {
  PnrrDetailRoute({
    _i50.Key? key,
    required String type,
    required int id,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PnrrDetailRouteArgs>();
      return _i49.WrappedRoute(
          child: _i35.PnrrDetailPage(
        key: args.key,
        type: args.type,
        id: args.id,
      ));
    },
  );
}

class PnrrDetailRouteArgs {
  const PnrrDetailRouteArgs({
    this.key,
    required this.type,
    required this.id,
  });

  final _i50.Key? key;

  final String type;

  final int id;

  @override
  String toString() {
    return 'PnrrDetailRouteArgs{key: $key, type: $type, id: $id}';
  }
}

/// generated route for
/// [_i36.PnrrServicesPage]
class PnrrServicesRoute extends _i49.PageRouteInfo<PnrrServicesRouteArgs> {
  PnrrServicesRoute({
    _i50.Key? key,
    required String? type,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          PnrrServicesRoute.name,
          args: PnrrServicesRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrServicesRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PnrrServicesRouteArgs>();
      return _i49.WrappedRoute(
          child: _i36.PnrrServicesPage(
        key: args.key,
        type: args.type,
      ));
    },
  );
}

class PnrrServicesRouteArgs {
  const PnrrServicesRouteArgs({
    this.key,
    required this.type,
  });

  final _i50.Key? key;

  final String? type;

  @override
  String toString() {
    return 'PnrrServicesRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i37.PointOfInterestListPage]
class PointOfInterestListRoute extends _i49.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i49.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i37.PointOfInterestListPage());
    },
  );
}

/// generated route for
/// [_i38.PrenotationPage]
class PrenotationRoute extends _i49.PageRouteInfo<void> {
  const PrenotationRoute({List<_i49.PageRouteInfo>? children})
      : super(
          PrenotationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrenotationRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i38.PrenotationPage();
    },
  );
}

/// generated route for
/// [_i39.ReservationsPager]
class ReservationsRouter extends _i49.PageRouteInfo<void> {
  const ReservationsRouter({List<_i49.PageRouteInfo>? children})
      : super(
          ReservationsRouter.name,
          initialChildren: children,
        );

  static const String name = 'ReservationsRouter';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return _i49.WrappedRoute(child: const _i39.ReservationsPager());
    },
  );
}

/// generated route for
/// [_i40.SelfPaymentsPage]
class SelfPaymentsRoute extends _i49.PageRouteInfo<SelfPaymentsRouteArgs> {
  SelfPaymentsRoute({
    _i50.Key? key,
    required String baseUrl,
    required String ente,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelfPaymentsRouteArgs>();
      return _i49.WrappedRoute(
          child: _i40.SelfPaymentsPage(
        key: args.key,
        baseUrl: args.baseUrl,
        ente: args.ente,
      ));
    },
  );
}

class SelfPaymentsRouteArgs {
  const SelfPaymentsRouteArgs({
    this.key,
    required this.baseUrl,
    required this.ente,
  });

  final _i50.Key? key;

  final String baseUrl;

  final String ente;

  @override
  String toString() {
    return 'SelfPaymentsRouteArgs{key: $key, baseUrl: $baseUrl, ente: $ente}';
  }
}

/// generated route for
/// [_i41.ServiceOnlineListPage]
class ServiceOnlineListRoute
    extends _i49.PageRouteInfo<ServiceOnlineListRouteArgs> {
  ServiceOnlineListRoute({
    _i52.Key? key,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          ServiceOnlineListRoute.name,
          args: ServiceOnlineListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ServiceOnlineListRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceOnlineListRouteArgs>(
          orElse: () => const ServiceOnlineListRouteArgs());
      return _i49.WrappedRoute(
          child: _i41.ServiceOnlineListPage(key: args.key));
    },
  );
}

class ServiceOnlineListRouteArgs {
  const ServiceOnlineListRouteArgs({this.key});

  final _i52.Key? key;

  @override
  String toString() {
    return 'ServiceOnlineListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i42.SettingsPage]
class SettingsRoute extends _i49.PageRouteInfo<void> {
  const SettingsRoute({List<_i49.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i42.SettingsPage();
    },
  );
}

/// generated route for
/// [_i43.SplashPage]
class SplashRoute extends _i49.PageRouteInfo<void> {
  const SplashRoute({List<_i49.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i43.SplashPage();
    },
  );
}

/// generated route for
/// [_i44.SubMenuPage]
class SubMenuRoute extends _i49.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i50.Key? key,
    required _i55.SubMenuType menu,
    required _i56.MenuItem item,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubMenuRouteArgs>();
      return _i44.SubMenuPage(
        key: args.key,
        menu: args.menu,
        item: args.item,
      );
    },
  );
}

class SubMenuRouteArgs {
  const SubMenuRouteArgs({
    this.key,
    required this.menu,
    required this.item,
  });

  final _i50.Key? key;

  final _i55.SubMenuType menu;

  final _i56.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i45.UserConfMenuEditPage]
class UserConfMenuEditRoute extends _i49.PageRouteInfo<void> {
  const UserConfMenuEditRoute({List<_i49.PageRouteInfo>? children})
      : super(
          UserConfMenuEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserConfMenuEditRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i45.UserConfMenuEditPage();
    },
  );
}

/// generated route for
/// [_i46.WeatherQualityPage]
class WeatherQualityRoute extends _i49.PageRouteInfo<void> {
  const WeatherQualityRoute({List<_i49.PageRouteInfo>? children})
      : super(
          WeatherQualityRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherQualityRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      return const _i46.WeatherQualityPage();
    },
  );
}

/// generated route for
/// [_i47.WebViewSpidAuthPage]
class WebViewSpidAuthRoute
    extends _i49.PageRouteInfo<WebViewSpidAuthRouteArgs> {
  WebViewSpidAuthRoute({
    _i50.Key? key,
    required String urlSpid,
    required String municipalityId,
    required String authSystem,
    List<_i49.PageRouteInfo>? children,
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

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebViewSpidAuthRouteArgs>();
      return _i49.WrappedRoute(
          child: _i47.WebViewSpidAuthPage(
        key: args.key,
        urlSpid: args.urlSpid,
        municipalityId: args.municipalityId,
        authSystem: args.authSystem,
      ));
    },
  );
}

class WebViewSpidAuthRouteArgs {
  const WebViewSpidAuthRouteArgs({
    this.key,
    required this.urlSpid,
    required this.municipalityId,
    required this.authSystem,
  });

  final _i50.Key? key;

  final String urlSpid;

  final String municipalityId;

  final String authSystem;

  @override
  String toString() {
    return 'WebViewSpidAuthRouteArgs{key: $key, urlSpid: $urlSpid, municipalityId: $municipalityId, authSystem: $authSystem}';
  }
}

/// generated route for
/// [_i48.WelcomePage]
class WelcomeRoute extends _i49.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i50.Key? key,
    required int municipalityId,
    List<_i49.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i49.PageInfo page = _i49.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WelcomeRouteArgs>();
      return _i49.WrappedRoute(
          child: _i48.WelcomePage(
        key: args.key,
        municipalityId: args.municipalityId,
      ));
    },
  );
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.municipalityId,
  });

  final _i50.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
