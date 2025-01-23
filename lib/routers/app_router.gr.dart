// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i72;
import 'package:flutter/cupertino.dart' as _i75;
import 'package:flutter/foundation.dart' as _i78;
import 'package:flutter/material.dart' as _i73;
import 'package:municipium/model/civil_defence/civil_defence_are_you_ready.dart'
    as _i77;
import 'package:municipium/model/ecoattivi/ecoattivi_message.dart' as _i79;
import 'package:municipium/model/ecoattivi/ecostop.dart' as _i80;
import 'package:municipium/model/menu/menu_item.dart' as _i83;
import 'package:municipium/model/menu/submenu_type.dart' as _i82;
import 'package:municipium/model/pages/pages.dart' as _i81;
import 'package:municipium/model/user/user_spid_model.dart' as _i74;
import 'package:municipium/services/network/dto/issue_detail_dto.dart' as _i76;
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
import 'package:municipium/ui/pages/ecoattivi_section/eco_message_detail_page.dart'
    as _i14;
import 'package:municipium/ui/pages/ecoattivi_section/eco_message_page.dart'
    as _i15;
import 'package:municipium/ui/pages/ecoattivi_section/eco_photo_section.dart'
    as _i16;
import 'package:municipium/ui/pages/ecoattivi_section/ecoattivi_home_page.dart'
    as _i17;
import 'package:municipium/ui/pages/ecoattivi_section/ecoattivi_quiz_pager.dart'
    as _i18;
import 'package:municipium/ui/pages/ecoattivi_section/ecostop_detail_page.dart'
    as _i19;
import 'package:municipium/ui/pages/ecoattivi_section/ecostop_section.dart'
    as _i20;
import 'package:municipium/ui/pages/ecoattivi_section/invite_friend_page.dart'
    as _i32;
import 'package:municipium/ui/pages/ecoattivi_section/qr_ecoattivi_page.dart'
    as _i57;
import 'package:municipium/ui/pages/ecoattivi_section/quiz_list_ecoattivi_page.dart'
    as _i59;
import 'package:municipium/ui/pages/events_section/event_detail_page.dart'
    as _i21;
import 'package:municipium/ui/pages/events_section/event_list_page.dart'
    as _i22;
import 'package:municipium/ui/pages/garbage_section/garbage_calendar_detail_page.dart'
    as _i23;
import 'package:municipium/ui/pages/garbage_section/garbage_calendar_element_list_page.dart'
    as _i24;
import 'package:municipium/ui/pages/garbage_section/garbage_calendar_page.dart'
    as _i25;
import 'package:municipium/ui/pages/garbage_section/garbage_element_detail_page.dart'
    as _i26;
import 'package:municipium/ui/pages/garbage_section/garbage_info_retirement_page.dart'
    as _i27;
import 'package:municipium/ui/pages/garbage_section/garbage_recycling_areas_page.dart'
    as _i28;
import 'package:municipium/ui/pages/issues_section/chat_message_page.dart'
    as _i4;
import 'package:municipium/ui/pages/issues_section/issue_detail_page.dart'
    as _i33;
import 'package:municipium/ui/pages/issues_section/issues_list_page.dart'
    as _i34;
import 'package:municipium/ui/pages/issues_section/new_issue_pager.dart'
    as _i42;
import 'package:municipium/ui/pages/issues_section/newissue_completed_page.dart'
    as _i44;
import 'package:municipium/ui/pages/lissi_section/lissi_dashboard_page.dart'
    as _i35;
import 'package:municipium/ui/pages/lissi_section/lissi_presentation_session_page.dart'
    as _i36;
import 'package:municipium/ui/pages/lissi_section/lissi_presentation_template_list_page.dart'
    as _i37;
import 'package:municipium/ui/pages/main_page.dart' as _i39;
import 'package:municipium/ui/pages/municipality_section/choose_municipality_page.dart'
    as _i5;
import 'package:municipium/ui/pages/municipality_section/core_municipality_page.dart'
    as _i12;
import 'package:municipium/ui/pages/municipality_section/home_page.dart'
    as _i29;
import 'package:municipium/ui/pages/municipality_section/info_municipality_detail_page.dart'
    as _i30;
import 'package:municipium/ui/pages/municipality_section/info_municipality_page.dart'
    as _i31;
import 'package:municipium/ui/pages/municipality_section/welcome_page.dart'
    as _i71;
import 'package:municipium/ui/pages/news_section/news_detail_page.dart' as _i45;
import 'package:municipium/ui/pages/news_section/news_list_page.dart' as _i46;
import 'package:municipium/ui/pages/onboarding_section/onboarding_page.dart'
    as _i47;
import 'package:municipium/ui/pages/onboarding_section/onboarding_search_municipality_page.dart'
    as _i48;
import 'package:municipium/ui/pages/online_service_detail_webview.dart' as _i49;
import 'package:municipium/ui/pages/payment_section/new_self_payment_pager.dart'
    as _i43;
import 'package:municipium/ui/pages/payment_section/payment_choice_page.dart'
    as _i50;
import 'package:municipium/ui/pages/payment_section/person_type_payment_page.dart'
    as _i51;
import 'package:municipium/ui/pages/payment_section/self_payments_page.dart'
    as _i61;
import 'package:municipium/ui/pages/personal_area_section/account_data_page.dart'
    as _i1;
import 'package:municipium/ui/pages/personal_area_section/account_preferece_page.dart'
    as _i2;
import 'package:municipium/ui/pages/personal_area_section/confirm_auth_spid_page.dart'
    as _i41;
import 'package:municipium/ui/pages/personal_area_section/login_spid_idp_list_page.dart'
    as _i38;
import 'package:municipium/ui/pages/personal_area_section/personal_area_menu_page.dart'
    as _i52;
import 'package:municipium/ui/pages/personal_area_section/webview_spid_auth_page.dart'
    as _i70;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_detail_page.dart'
    as _i53;
import 'package:municipium/ui/pages/pnrr_services_section/pnrr_services_page.dart'
    as _i54;
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart'
    as _i55;
import 'package:municipium/ui/pages/pois_section/detail_poi_page.dart' as _i13;
import 'package:municipium/ui/pages/pois_section/maps_page.dart' as _i40;
import 'package:municipium/ui/pages/prenotations_section/prenotation_page.dart'
    as _i56;
import 'package:municipium/ui/pages/reservations_section/reservations_pager.dart'
    as _i60;
import 'package:municipium/ui/pages/service_online_section/service_online_list_page.dart'
    as _i62;
import 'package:municipium/ui/pages/settings_section/settings_page.dart'
    as _i63;
import 'package:municipium/ui/pages/splash_page.dart' as _i64;
import 'package:municipium/ui/pages/submenu_page.dart' as _i65;
import 'package:municipium/ui/pages/survey_section/question_survey_page.dart'
    as _i58;
import 'package:municipium/ui/pages/survey_section/survey_detail_page.dart'
    as _i67;
import 'package:municipium/ui/pages/survey_section/survey_list_page.dart'
    as _i66;
import 'package:municipium/ui/pages/user_configuration_section/user_conf_menu_edit_page.dart'
    as _i68;
import 'package:municipium/ui/pages/weather_section/weather_quality_page.dart'
    as _i69;

/// generated route for
/// [_i1.AccountDataPage]
class AccountDataRoute extends _i72.PageRouteInfo<AccountDataRouteArgs> {
  AccountDataRoute({
    _i73.Key? key,
    required _i74.SpidUserModel userModel,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          AccountDataRoute.name,
          args: AccountDataRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountDataRoute';

  static _i72.PageInfo page = _i72.PageInfo(
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

  final _i73.Key? key;

  final _i74.SpidUserModel userModel;

  @override
  String toString() {
    return 'AccountDataRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [_i2.AccountPreferecePage]
class AccountPrefereceRoute extends _i72.PageRouteInfo<void> {
  const AccountPrefereceRoute({List<_i72.PageRouteInfo>? children})
      : super(
          AccountPrefereceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountPrefereceRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountPreferecePage();
    },
  );
}

/// generated route for
/// [_i3.CalendarPage]
class CalendarRoute extends _i72.PageRouteInfo<CalendarRouteArgs> {
  CalendarRoute({
    _i75.Key? key,
    required _i75.GlobalKey<_i73.ScaffoldState> scaffoldKey,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          CalendarRoute.name,
          args: CalendarRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CalendarRouteArgs>();
      return _i72.WrappedRoute(
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

  final _i75.Key? key;

  final _i75.GlobalKey<_i73.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'CalendarRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i4.ChatMessagePage]
class ChatMessageRoute extends _i72.PageRouteInfo<ChatMessageRouteArgs> {
  ChatMessageRoute({
    _i73.Key? key,
    required List<_i76.IssueChatItem> messages,
    required String title,
    required int issueId,
    required String municName,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatMessageRouteArgs>();
      return _i72.WrappedRoute(
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

  final _i73.Key? key;

  final List<_i76.IssueChatItem> messages;

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
    extends _i72.PageRouteInfo<ChooseMunicipalityRouteArgs> {
  ChooseMunicipalityRoute({
    _i75.Key? key,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          ChooseMunicipalityRoute.name,
          args: ChooseMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChooseMunicipalityRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChooseMunicipalityRouteArgs>(
          orElse: () => const ChooseMunicipalityRouteArgs());
      return _i72.WrappedRoute(
          child: _i5.ChooseMunicipalityPage(key: args.key));
    },
  );
}

class ChooseMunicipalityRouteArgs {
  const ChooseMunicipalityRouteArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'ChooseMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.CivilDefenceAreYouReadyDetailPage]
class CivilDefenceAreYouReadyDetailRoute
    extends _i72.PageRouteInfo<CivilDefenceAreYouReadyDetailRouteArgs> {
  CivilDefenceAreYouReadyDetailRoute({
    _i73.Key? key,
    required _i77.CivilDefenceAreYouReady element,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          CivilDefenceAreYouReadyDetailRoute.name,
          args: CivilDefenceAreYouReadyDetailRouteArgs(
            key: key,
            element: element,
          ),
          initialChildren: children,
        );

  static const String name = 'CivilDefenceAreYouReadyDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
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

  final _i73.Key? key;

  final _i77.CivilDefenceAreYouReady element;

  @override
  String toString() {
    return 'CivilDefenceAreYouReadyDetailRouteArgs{key: $key, element: $element}';
  }
}

/// generated route for
/// [_i7.CivilDefenceAreYouReadyPage]
class CivilDefenceAreYouReadyRoute extends _i72.PageRouteInfo<void> {
  const CivilDefenceAreYouReadyRoute({List<_i72.PageRouteInfo>? children})
      : super(
          CivilDefenceAreYouReadyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceAreYouReadyRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i7.CivilDefenceAreYouReadyPage());
    },
  );
}

/// generated route for
/// [_i8.CivilDefenceInformationsPage]
class CivilDefenceInformationsRoute extends _i72.PageRouteInfo<void> {
  const CivilDefenceInformationsRoute({List<_i72.PageRouteInfo>? children})
      : super(
          CivilDefenceInformationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceInformationsRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i8.CivilDefenceInformationsPage());
    },
  );
}

/// generated route for
/// [_i9.CivilDefenceLevelPage]
class CivilDefenceLevelRoute extends _i72.PageRouteInfo<void> {
  const CivilDefenceLevelRoute({List<_i72.PageRouteInfo>? children})
      : super(
          CivilDefenceLevelRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceLevelRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i9.CivilDefenceLevelPage());
    },
  );
}

/// generated route for
/// [_i10.CivilDefenceNewsPage]
class CivilDefenceNewsRoute extends _i72.PageRouteInfo<void> {
  const CivilDefenceNewsRoute({List<_i72.PageRouteInfo>? children})
      : super(
          CivilDefenceNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceNewsRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i10.CivilDefenceNewsPage());
    },
  );
}

/// generated route for
/// [_i11.CivilDefenceNumbersPage]
class CivilDefenceNumbersRoute extends _i72.PageRouteInfo<void> {
  const CivilDefenceNumbersRoute({List<_i72.PageRouteInfo>? children})
      : super(
          CivilDefenceNumbersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CivilDefenceNumbersRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i11.CivilDefenceNumbersPage());
    },
  );
}

/// generated route for
/// [_i12.CoreMunicipalityPage]
class CoreMunicipalityRoute
    extends _i72.PageRouteInfo<CoreMunicipalityRouteArgs> {
  CoreMunicipalityRoute({
    _i75.Key? key,
    required int municipalityId,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          CoreMunicipalityRoute.name,
          args: CoreMunicipalityRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'CoreMunicipalityRoute';

  static _i72.PageInfo page = _i72.PageInfo(
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

  final _i75.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'CoreMunicipalityRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i13.DetailPoiPage]
class DetailPoiRoute extends _i72.PageRouteInfo<DetailPoiRouteArgs> {
  DetailPoiRoute({
    _i75.Key? key,
    required int poiId,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          DetailPoiRoute.name,
          args: DetailPoiRouteArgs(
            key: key,
            poiId: poiId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPoiRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailPoiRouteArgs>();
      return _i72.WrappedRoute(
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

  final _i75.Key? key;

  final int poiId;

  @override
  String toString() {
    return 'DetailPoiRouteArgs{key: $key, poiId: $poiId}';
  }
}

/// generated route for
/// [_i14.EcoMessageDetailPage]
class EcoMessageDetailRoute
    extends _i72.PageRouteInfo<EcoMessageDetailRouteArgs> {
  EcoMessageDetailRoute({
    _i78.Key? key,
    required _i79.EcoattiviMessage detail,
    required String token,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          EcoMessageDetailRoute.name,
          args: EcoMessageDetailRouteArgs(
            key: key,
            detail: detail,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'EcoMessageDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EcoMessageDetailRouteArgs>();
      return _i14.EcoMessageDetailPage(
        key: args.key,
        detail: args.detail,
        token: args.token,
      );
    },
  );
}

class EcoMessageDetailRouteArgs {
  const EcoMessageDetailRouteArgs({
    this.key,
    required this.detail,
    required this.token,
  });

  final _i78.Key? key;

  final _i79.EcoattiviMessage detail;

  final String token;

  @override
  String toString() {
    return 'EcoMessageDetailRouteArgs{key: $key, detail: $detail, token: $token}';
  }
}

/// generated route for
/// [_i15.EcoMessagePage]
class EcoMessageRoute extends _i72.PageRouteInfo<EcoMessageRouteArgs> {
  EcoMessageRoute({
    _i73.Key? key,
    required String token,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          EcoMessageRoute.name,
          args: EcoMessageRouteArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'EcoMessageRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EcoMessageRouteArgs>();
      return _i72.WrappedRoute(
          child: _i15.EcoMessagePage(
        key: args.key,
        token: args.token,
      ));
    },
  );
}

class EcoMessageRouteArgs {
  const EcoMessageRouteArgs({
    this.key,
    required this.token,
  });

  final _i73.Key? key;

  final String token;

  @override
  String toString() {
    return 'EcoMessageRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i16.EcoPhotoSection]
class EcoPhotoSection extends _i72.PageRouteInfo<EcoPhotoSectionArgs> {
  EcoPhotoSection({
    _i78.Key? key,
    required String token,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          EcoPhotoSection.name,
          args: EcoPhotoSectionArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'EcoPhotoSection';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EcoPhotoSectionArgs>();
      return _i72.WrappedRoute(
          child: _i16.EcoPhotoSection(
        key: args.key,
        token: args.token,
      ));
    },
  );
}

class EcoPhotoSectionArgs {
  const EcoPhotoSectionArgs({
    this.key,
    required this.token,
  });

  final _i78.Key? key;

  final String token;

  @override
  String toString() {
    return 'EcoPhotoSectionArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i17.EcoattiviHomePage]
class EcoattiviHomeRoute extends _i72.PageRouteInfo<void> {
  const EcoattiviHomeRoute({List<_i72.PageRouteInfo>? children})
      : super(
          EcoattiviHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EcoattiviHomeRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i17.EcoattiviHomePage();
    },
  );
}

/// generated route for
/// [_i18.EcoattiviQuizPager]
class EcoattiviQuizRouter extends _i72.PageRouteInfo<EcoattiviQuizRouterArgs> {
  EcoattiviQuizRouter({
    _i78.Key? key,
    required int quizId,
    required String token,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          EcoattiviQuizRouter.name,
          args: EcoattiviQuizRouterArgs(
            key: key,
            quizId: quizId,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'EcoattiviQuizRouter';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EcoattiviQuizRouterArgs>();
      return _i72.WrappedRoute(
          child: _i18.EcoattiviQuizPager(
        key: args.key,
        quizId: args.quizId,
        token: args.token,
      ));
    },
  );
}

class EcoattiviQuizRouterArgs {
  const EcoattiviQuizRouterArgs({
    this.key,
    required this.quizId,
    required this.token,
  });

  final _i78.Key? key;

  final int quizId;

  final String token;

  @override
  String toString() {
    return 'EcoattiviQuizRouterArgs{key: $key, quizId: $quizId, token: $token}';
  }
}

/// generated route for
/// [_i19.EcostopDetailPage]
class EcostopDetailRoute extends _i72.PageRouteInfo<EcostopDetailRouteArgs> {
  EcostopDetailRoute({
    _i78.Key? key,
    required _i80.Ecostop ecostop,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          EcostopDetailRoute.name,
          args: EcostopDetailRouteArgs(
            key: key,
            ecostop: ecostop,
          ),
          initialChildren: children,
        );

  static const String name = 'EcostopDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EcostopDetailRouteArgs>();
      return _i19.EcostopDetailPage(
        key: args.key,
        ecostop: args.ecostop,
      );
    },
  );
}

class EcostopDetailRouteArgs {
  const EcostopDetailRouteArgs({
    this.key,
    required this.ecostop,
  });

  final _i78.Key? key;

  final _i80.Ecostop ecostop;

  @override
  String toString() {
    return 'EcostopDetailRouteArgs{key: $key, ecostop: $ecostop}';
  }
}

/// generated route for
/// [_i20.EcostopSection]
class EcostopSection extends _i72.PageRouteInfo<EcostopSectionArgs> {
  EcostopSection({
    _i78.Key? key,
    required String token,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          EcostopSection.name,
          args: EcostopSectionArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'EcostopSection';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EcostopSectionArgs>();
      return _i72.WrappedRoute(
          child: _i20.EcostopSection(
        key: args.key,
        token: args.token,
      ));
    },
  );
}

class EcostopSectionArgs {
  const EcostopSectionArgs({
    this.key,
    required this.token,
  });

  final _i78.Key? key;

  final String token;

  @override
  String toString() {
    return 'EcostopSectionArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i21.EventDetailPage]
class EventDetailRoute extends _i72.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i73.Key? key,
    required int eventId,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i21.EventDetailPage(
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

  final _i73.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i22.EventListPage]
class EventListRoute extends _i72.PageRouteInfo<void> {
  const EventListRoute({List<_i72.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i22.EventListPage());
    },
  );
}

/// generated route for
/// [_i23.GarbageCalendarDetailPage]
class GarbageCalendarDetailRoute
    extends _i72.PageRouteInfo<GarbageCalendarDetailRouteArgs> {
  GarbageCalendarDetailRoute({
    _i75.Key? key,
    required String id,
    required String start,
    required String end,
    required String title,
    required String subtitle,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          GarbageCalendarDetailRoute.name,
          args: GarbageCalendarDetailRouteArgs(
            key: key,
            id: id,
            start: start,
            end: end,
            title: title,
            subtitle: subtitle,
          ),
          initialChildren: children,
        );

  static const String name = 'GarbageCalendarDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GarbageCalendarDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i23.GarbageCalendarDetailPage(
        key: args.key,
        id: args.id,
        start: args.start,
        end: args.end,
        title: args.title,
        subtitle: args.subtitle,
      ));
    },
  );
}

class GarbageCalendarDetailRouteArgs {
  const GarbageCalendarDetailRouteArgs({
    this.key,
    required this.id,
    required this.start,
    required this.end,
    required this.title,
    required this.subtitle,
  });

  final _i75.Key? key;

  final String id;

  final String start;

  final String end;

  final String title;

  final String subtitle;

  @override
  String toString() {
    return 'GarbageCalendarDetailRouteArgs{key: $key, id: $id, start: $start, end: $end, title: $title, subtitle: $subtitle}';
  }
}

/// generated route for
/// [_i24.GarbageCalendarElementListPage]
class GarbageCalendarElementListRoute extends _i72.PageRouteInfo<void> {
  const GarbageCalendarElementListRoute({List<_i72.PageRouteInfo>? children})
      : super(
          GarbageCalendarElementListRoute.name,
          initialChildren: children,
        );

  static const String name = 'GarbageCalendarElementListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(
          child: const _i24.GarbageCalendarElementListPage());
    },
  );
}

/// generated route for
/// [_i25.GarbageCalendarPage]
class GarbageCalendarRoute extends _i72.PageRouteInfo<void> {
  const GarbageCalendarRoute({List<_i72.PageRouteInfo>? children})
      : super(
          GarbageCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'GarbageCalendarRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i25.GarbageCalendarPage());
    },
  );
}

/// generated route for
/// [_i26.GarbageElementDetailPage]
class GarbageElementDetailRoute
    extends _i72.PageRouteInfo<GarbageElementDetailRouteArgs> {
  GarbageElementDetailRoute({
    _i73.Key? key,
    required int id,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          GarbageElementDetailRoute.name,
          args: GarbageElementDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'GarbageElementDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GarbageElementDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i26.GarbageElementDetailPage(
        key: args.key,
        id: args.id,
      ));
    },
  );
}

class GarbageElementDetailRouteArgs {
  const GarbageElementDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i73.Key? key;

  final int id;

  @override
  String toString() {
    return 'GarbageElementDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i27.GarbageInfoRetirementPage]
class GarbageInfoRetirementRoute extends _i72.PageRouteInfo<void> {
  const GarbageInfoRetirementRoute({List<_i72.PageRouteInfo>? children})
      : super(
          GarbageInfoRetirementRoute.name,
          initialChildren: children,
        );

  static const String name = 'GarbageInfoRetirementRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i27.GarbageInfoRetirementPage());
    },
  );
}

/// generated route for
/// [_i28.GarbageReciclingAreasPage]
class GarbageReciclingAreasRoute extends _i72.PageRouteInfo<void> {
  const GarbageReciclingAreasRoute({List<_i72.PageRouteInfo>? children})
      : super(
          GarbageReciclingAreasRoute.name,
          initialChildren: children,
        );

  static const String name = 'GarbageReciclingAreasRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i28.GarbageReciclingAreasPage());
    },
  );
}

/// generated route for
/// [_i29.HomePage]
class HomeRoute extends _i72.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i73.Key? key,
    required _i73.GlobalKey<_i73.ScaffoldState> scaffoldKey,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i29.HomePage(
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

  final _i73.Key? key;

  final _i73.GlobalKey<_i73.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i30.InfoMunicipalityDetailPage]
class InfoMunicipalityDetailRoute
    extends _i72.PageRouteInfo<InfoMunicipalityDetailRouteArgs> {
  InfoMunicipalityDetailRoute({
    _i75.Key? key,
    required int id,
    List<_i81.Pages>? pages,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          InfoMunicipalityDetailRoute.name,
          args: InfoMunicipalityDetailRouteArgs(
            key: key,
            id: id,
            pages: pages,
          ),
          initialChildren: children,
        );

  static const String name = 'InfoMunicipalityDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InfoMunicipalityDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i30.InfoMunicipalityDetailPage(
        key: args.key,
        id: args.id,
        pages: args.pages,
      ));
    },
  );
}

class InfoMunicipalityDetailRouteArgs {
  const InfoMunicipalityDetailRouteArgs({
    this.key,
    required this.id,
    this.pages,
  });

  final _i75.Key? key;

  final int id;

  final List<_i81.Pages>? pages;

  @override
  String toString() {
    return 'InfoMunicipalityDetailRouteArgs{key: $key, id: $id, pages: $pages}';
  }
}

/// generated route for
/// [_i31.InfoMunicipalityPage]
class InfoMunicipalityRoute extends _i72.PageRouteInfo<void> {
  const InfoMunicipalityRoute({List<_i72.PageRouteInfo>? children})
      : super(
          InfoMunicipalityRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoMunicipalityRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i31.InfoMunicipalityPage());
    },
  );
}

/// generated route for
/// [_i32.InviteFriendPage]
class InviteFriendRoute extends _i72.PageRouteInfo<InviteFriendRouteArgs> {
  InviteFriendRoute({
    _i73.Key? key,
    required String code,
    required int punti,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          InviteFriendRoute.name,
          args: InviteFriendRouteArgs(
            key: key,
            code: code,
            punti: punti,
          ),
          initialChildren: children,
        );

  static const String name = 'InviteFriendRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InviteFriendRouteArgs>();
      return _i32.InviteFriendPage(
        key: args.key,
        code: args.code,
        punti: args.punti,
      );
    },
  );
}

class InviteFriendRouteArgs {
  const InviteFriendRouteArgs({
    this.key,
    required this.code,
    required this.punti,
  });

  final _i73.Key? key;

  final String code;

  final int punti;

  @override
  String toString() {
    return 'InviteFriendRouteArgs{key: $key, code: $code, punti: $punti}';
  }
}

/// generated route for
/// [_i33.IssueDetailPage]
class IssueDetailRoute extends _i72.PageRouteInfo<IssueDetailRouteArgs> {
  IssueDetailRoute({
    _i73.Key? key,
    required int id,
    required String udid,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<IssueDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i33.IssueDetailPage(
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

  final _i73.Key? key;

  final int id;

  final String udid;

  @override
  String toString() {
    return 'IssueDetailRouteArgs{key: $key, id: $id, udid: $udid}';
  }
}

/// generated route for
/// [_i34.IssuesListPage]
class IssuesListRoute extends _i72.PageRouteInfo<IssuesListRouteArgs> {
  IssuesListRoute({
    _i73.Key? key,
    required String udid,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          IssuesListRoute.name,
          args: IssuesListRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'IssuesListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<IssuesListRouteArgs>();
      return _i72.WrappedRoute(
          child: _i34.IssuesListPage(
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

  final _i73.Key? key;

  final String udid;

  @override
  String toString() {
    return 'IssuesListRouteArgs{key: $key, udid: $udid}';
  }
}

/// generated route for
/// [_i35.LissiDashboardPage]
class LissiDashboardRoute extends _i72.PageRouteInfo<void> {
  const LissiDashboardRoute({List<_i72.PageRouteInfo>? children})
      : super(
          LissiDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'LissiDashboardRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i35.LissiDashboardPage());
    },
  );
}

/// generated route for
/// [_i36.LissiPresentationSessionPage]
class LissiPresentationSessionRoute
    extends _i72.PageRouteInfo<LissiPresentationSessionRouteArgs> {
  LissiPresentationSessionRoute({
    _i73.Key? key,
    required String presentationSessionId,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          LissiPresentationSessionRoute.name,
          args: LissiPresentationSessionRouteArgs(
            key: key,
            presentationSessionId: presentationSessionId,
          ),
          initialChildren: children,
        );

  static const String name = 'LissiPresentationSessionRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LissiPresentationSessionRouteArgs>();
      return _i72.WrappedRoute(
          child: _i36.LissiPresentationSessionPage(
        key: args.key,
        presentationSessionId: args.presentationSessionId,
      ));
    },
  );
}

class LissiPresentationSessionRouteArgs {
  const LissiPresentationSessionRouteArgs({
    this.key,
    required this.presentationSessionId,
  });

  final _i73.Key? key;

  final String presentationSessionId;

  @override
  String toString() {
    return 'LissiPresentationSessionRouteArgs{key: $key, presentationSessionId: $presentationSessionId}';
  }
}

/// generated route for
/// [_i37.LissiPresentationTemplateListPage]
class LissiPresentationTemplateListRoute extends _i72.PageRouteInfo<void> {
  const LissiPresentationTemplateListRoute({List<_i72.PageRouteInfo>? children})
      : super(
          LissiPresentationTemplateListRoute.name,
          initialChildren: children,
        );

  static const String name = 'LissiPresentationTemplateListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(
          child: const _i37.LissiPresentationTemplateListPage());
    },
  );
}

/// generated route for
/// [_i38.LoginSpidIdpListPage]
class LoginSpidIdpListRoute
    extends _i72.PageRouteInfo<LoginSpidIdpListRouteArgs> {
  LoginSpidIdpListRoute({
    _i75.Key? key,
    required bool ecoattivi,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          LoginSpidIdpListRoute.name,
          args: LoginSpidIdpListRouteArgs(
            key: key,
            ecoattivi: ecoattivi,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginSpidIdpListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginSpidIdpListRouteArgs>();
      return _i72.WrappedRoute(
          child: _i38.LoginSpidIdpListPage(
        key: args.key,
        ecoattivi: args.ecoattivi,
      ));
    },
  );
}

class LoginSpidIdpListRouteArgs {
  const LoginSpidIdpListRouteArgs({
    this.key,
    required this.ecoattivi,
  });

  final _i75.Key? key;

  final bool ecoattivi;

  @override
  String toString() {
    return 'LoginSpidIdpListRouteArgs{key: $key, ecoattivi: $ecoattivi}';
  }
}

/// generated route for
/// [_i39.MainPage]
class MainRoute extends _i72.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i73.Key? key,
    required int municipalityId,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>();
      return _i72.WrappedRoute(
          child: _i39.MainPage(
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

  final _i73.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}

/// generated route for
/// [_i40.MapsPage]
class MapsRoute extends _i72.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    _i75.Key? key,
    required _i75.GlobalKey<_i73.ScaffoldState> scaffoldKey,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MapsRouteArgs>();
      return _i72.WrappedRoute(
          child: _i40.MapsPage(
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

  final _i75.Key? key;

  final _i75.GlobalKey<_i73.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i41.MyWidget]
class MyWidget extends _i72.PageRouteInfo<void> {
  const MyWidget({List<_i72.PageRouteInfo>? children})
      : super(
          MyWidget.name,
          initialChildren: children,
        );

  static const String name = 'MyWidget';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i41.MyWidget();
    },
  );
}

/// generated route for
/// [_i42.NewIssuePager]
class NewIssueRouter extends _i72.PageRouteInfo<NewIssueRouterArgs> {
  NewIssueRouter({
    _i75.Key? key,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          NewIssueRouter.name,
          args: NewIssueRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewIssueRouter';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewIssueRouterArgs>(
          orElse: () => const NewIssueRouterArgs());
      return _i72.WrappedRoute(child: _i42.NewIssuePager(key: args.key));
    },
  );
}

class NewIssueRouterArgs {
  const NewIssueRouterArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'NewIssueRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i43.NewSelfPaymentPager]
class NewSelfPaymentRouter
    extends _i72.PageRouteInfo<NewSelfPaymentRouterArgs> {
  NewSelfPaymentRouter({
    _i73.Key? key,
    required String baseUrl,
    required String ente,
    required String codice,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewSelfPaymentRouterArgs>();
      return _i72.WrappedRoute(
          child: _i43.NewSelfPaymentPager(
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

  final _i73.Key? key;

  final String baseUrl;

  final String ente;

  final String codice;

  @override
  String toString() {
    return 'NewSelfPaymentRouterArgs{key: $key, baseUrl: $baseUrl, ente: $ente, codice: $codice}';
  }
}

/// generated route for
/// [_i44.NewissueCompletedPage]
class NewissueCompletedRoute
    extends _i72.PageRouteInfo<NewissueCompletedRouteArgs> {
  NewissueCompletedRoute({
    _i73.Key? key,
    required String udid,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          NewissueCompletedRoute.name,
          args: NewissueCompletedRouteArgs(
            key: key,
            udid: udid,
          ),
          initialChildren: children,
        );

  static const String name = 'NewissueCompletedRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewissueCompletedRouteArgs>();
      return _i44.NewissueCompletedPage(
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

  final _i73.Key? key;

  final String udid;

  @override
  String toString() {
    return 'NewissueCompletedRouteArgs{key: $key, udid: $udid}';
  }
}

/// generated route for
/// [_i45.NewsDetailPage]
class NewsDetailRoute extends _i72.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i73.Key? key,
    required int newsId,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i45.NewsDetailPage(
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

  final _i73.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i46.NewsListPage]
class NewsListRoute extends _i72.PageRouteInfo<void> {
  const NewsListRoute({List<_i72.PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i46.NewsListPage());
    },
  );
}

/// generated route for
/// [_i47.OnboardingPage]
class OnboardingRoute extends _i72.PageRouteInfo<void> {
  const OnboardingRoute({List<_i72.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i47.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i48.OnboardingSearchMunicipalityPage]
class OnboardingSearchMunicipalityRoute
    extends _i72.PageRouteInfo<OnboardingSearchMunicipalityRouteArgs> {
  OnboardingSearchMunicipalityRoute({
    _i75.Key? key,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          OnboardingSearchMunicipalityRoute.name,
          args: OnboardingSearchMunicipalityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingSearchMunicipalityRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingSearchMunicipalityRouteArgs>(
          orElse: () => const OnboardingSearchMunicipalityRouteArgs());
      return _i72.WrappedRoute(
          child: _i48.OnboardingSearchMunicipalityPage(key: args.key));
    },
  );
}

class OnboardingSearchMunicipalityRouteArgs {
  const OnboardingSearchMunicipalityRouteArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'OnboardingSearchMunicipalityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i49.OnlineServiceDetailWebviewPage]
class OnlineServiceDetailWebviewRoute
    extends _i72.PageRouteInfo<OnlineServiceDetailWebviewRouteArgs> {
  OnlineServiceDetailWebviewRoute({
    _i73.Key? key,
    required String url,
    required String name,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnlineServiceDetailWebviewRouteArgs>();
      return _i49.OnlineServiceDetailWebviewPage(
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

  final _i73.Key? key;

  final String url;

  final String name;

  @override
  String toString() {
    return 'OnlineServiceDetailWebviewRouteArgs{key: $key, url: $url, name: $name}';
  }
}

/// generated route for
/// [_i50.PaymentChoicePage]
class PaymentChoiceRoute extends _i72.PageRouteInfo<void> {
  const PaymentChoiceRoute({List<_i72.PageRouteInfo>? children})
      : super(
          PaymentChoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentChoiceRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i50.PaymentChoicePage();
    },
  );
}

/// generated route for
/// [_i51.PersonTypePaymentPage]
class PersonTypePaymentRoute
    extends _i72.PageRouteInfo<PersonTypePaymentRouteArgs> {
  PersonTypePaymentRoute({
    _i73.Key? key,
    required String baseUrl,
    required String ente,
    required String codice,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PersonTypePaymentRouteArgs>();
      return _i72.WrappedRoute(
          child: _i51.PersonTypePaymentPage(
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

  final _i73.Key? key;

  final String baseUrl;

  final String ente;

  final String codice;

  @override
  String toString() {
    return 'PersonTypePaymentRouteArgs{key: $key, baseUrl: $baseUrl, ente: $ente, codice: $codice}';
  }
}

/// generated route for
/// [_i52.PersonalAreaMenuPage]
class PersonalAreaMenuRoute
    extends _i72.PageRouteInfo<PersonalAreaMenuRouteArgs> {
  PersonalAreaMenuRoute({
    _i75.Key? key,
    required _i75.GlobalKey<_i73.ScaffoldState> scaffoldKey,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          PersonalAreaMenuRoute.name,
          args: PersonalAreaMenuRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalAreaMenuRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PersonalAreaMenuRouteArgs>();
      return _i72.WrappedRoute(
          child: _i52.PersonalAreaMenuPage(
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

  final _i75.Key? key;

  final _i75.GlobalKey<_i73.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'PersonalAreaMenuRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i53.PnrrDetailPage]
class PnrrDetailRoute extends _i72.PageRouteInfo<PnrrDetailRouteArgs> {
  PnrrDetailRoute({
    _i73.Key? key,
    required String type,
    required int id,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PnrrDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i53.PnrrDetailPage(
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

  final _i73.Key? key;

  final String type;

  final int id;

  @override
  String toString() {
    return 'PnrrDetailRouteArgs{key: $key, type: $type, id: $id}';
  }
}

/// generated route for
/// [_i54.PnrrServicesPage]
class PnrrServicesRoute extends _i72.PageRouteInfo<PnrrServicesRouteArgs> {
  PnrrServicesRoute({
    _i73.Key? key,
    required String? type,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          PnrrServicesRoute.name,
          args: PnrrServicesRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'PnrrServicesRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PnrrServicesRouteArgs>();
      return _i72.WrappedRoute(
          child: _i54.PnrrServicesPage(
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

  final _i73.Key? key;

  final String? type;

  @override
  String toString() {
    return 'PnrrServicesRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i55.PointOfInterestListPage]
class PointOfInterestListRoute extends _i72.PageRouteInfo<void> {
  const PointOfInterestListRoute({List<_i72.PageRouteInfo>? children})
      : super(
          PointOfInterestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointOfInterestListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i55.PointOfInterestListPage());
    },
  );
}

/// generated route for
/// [_i56.PrenotationPage]
class PrenotationRoute extends _i72.PageRouteInfo<void> {
  const PrenotationRoute({List<_i72.PageRouteInfo>? children})
      : super(
          PrenotationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrenotationRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i56.PrenotationPage();
    },
  );
}

/// generated route for
/// [_i57.QrEcoattiviPage]
class QrEcoattiviRoute extends _i72.PageRouteInfo<void> {
  const QrEcoattiviRoute({List<_i72.PageRouteInfo>? children})
      : super(
          QrEcoattiviRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrEcoattiviRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i57.QrEcoattiviPage();
    },
  );
}

/// generated route for
/// [_i58.QuestionSurveyPage]
class QuestionSurveyRoute extends _i72.PageRouteInfo<QuestionSurveyRouteArgs> {
  QuestionSurveyRoute({
    _i73.Key? key,
    required int id,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          QuestionSurveyRoute.name,
          args: QuestionSurveyRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'QuestionSurveyRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuestionSurveyRouteArgs>();
      return _i72.WrappedRoute(
          child: _i58.QuestionSurveyPage(
        key: args.key,
        id: args.id,
      ));
    },
  );
}

class QuestionSurveyRouteArgs {
  const QuestionSurveyRouteArgs({
    this.key,
    required this.id,
  });

  final _i73.Key? key;

  final int id;

  @override
  String toString() {
    return 'QuestionSurveyRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i59.QuizListEcoattiviPage]
class QuizListEcoattiviRoute
    extends _i72.PageRouteInfo<QuizListEcoattiviRouteArgs> {
  QuizListEcoattiviRoute({
    _i78.Key? key,
    required String token,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          QuizListEcoattiviRoute.name,
          args: QuizListEcoattiviRouteArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizListEcoattiviRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizListEcoattiviRouteArgs>();
      return _i72.WrappedRoute(
          child: _i59.QuizListEcoattiviPage(
        key: args.key,
        token: args.token,
      ));
    },
  );
}

class QuizListEcoattiviRouteArgs {
  const QuizListEcoattiviRouteArgs({
    this.key,
    required this.token,
  });

  final _i78.Key? key;

  final String token;

  @override
  String toString() {
    return 'QuizListEcoattiviRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i60.ReservationsPager]
class ReservationsRouter extends _i72.PageRouteInfo<void> {
  const ReservationsRouter({List<_i72.PageRouteInfo>? children})
      : super(
          ReservationsRouter.name,
          initialChildren: children,
        );

  static const String name = 'ReservationsRouter';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i60.ReservationsPager());
    },
  );
}

/// generated route for
/// [_i61.SelfPaymentsPage]
class SelfPaymentsRoute extends _i72.PageRouteInfo<SelfPaymentsRouteArgs> {
  SelfPaymentsRoute({
    _i73.Key? key,
    required String baseUrl,
    required String ente,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelfPaymentsRouteArgs>();
      return _i72.WrappedRoute(
          child: _i61.SelfPaymentsPage(
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

  final _i73.Key? key;

  final String baseUrl;

  final String ente;

  @override
  String toString() {
    return 'SelfPaymentsRouteArgs{key: $key, baseUrl: $baseUrl, ente: $ente}';
  }
}

/// generated route for
/// [_i62.ServiceOnlineListPage]
class ServiceOnlineListRoute
    extends _i72.PageRouteInfo<ServiceOnlineListRouteArgs> {
  ServiceOnlineListRoute({
    _i75.Key? key,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          ServiceOnlineListRoute.name,
          args: ServiceOnlineListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ServiceOnlineListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceOnlineListRouteArgs>(
          orElse: () => const ServiceOnlineListRouteArgs());
      return _i72.WrappedRoute(
          child: _i62.ServiceOnlineListPage(key: args.key));
    },
  );
}

class ServiceOnlineListRouteArgs {
  const ServiceOnlineListRouteArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'ServiceOnlineListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i63.SettingsPage]
class SettingsRoute extends _i72.PageRouteInfo<void> {
  const SettingsRoute({List<_i72.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i63.SettingsPage();
    },
  );
}

/// generated route for
/// [_i64.SplashPage]
class SplashRoute extends _i72.PageRouteInfo<void> {
  const SplashRoute({List<_i72.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i64.SplashPage();
    },
  );
}

/// generated route for
/// [_i65.SubMenuPage]
class SubMenuRoute extends _i72.PageRouteInfo<SubMenuRouteArgs> {
  SubMenuRoute({
    _i73.Key? key,
    required _i82.SubMenuType menu,
    required _i83.MenuItem item,
    List<_i72.PageRouteInfo>? children,
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

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubMenuRouteArgs>();
      return _i65.SubMenuPage(
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

  final _i73.Key? key;

  final _i82.SubMenuType menu;

  final _i83.MenuItem item;

  @override
  String toString() {
    return 'SubMenuRouteArgs{key: $key, menu: $menu, item: $item}';
  }
}

/// generated route for
/// [_i66.SurveryListPage]
class SurveryListRoute extends _i72.PageRouteInfo<void> {
  const SurveryListRoute({List<_i72.PageRouteInfo>? children})
      : super(
          SurveryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'SurveryListRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return _i72.WrappedRoute(child: const _i66.SurveryListPage());
    },
  );
}

/// generated route for
/// [_i67.SurveyDetailPage]
class SurveyDetailRoute extends _i72.PageRouteInfo<SurveyDetailRouteArgs> {
  SurveyDetailRoute({
    _i73.Key? key,
    required int id,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          SurveyDetailRoute.name,
          args: SurveyDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyDetailRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyDetailRouteArgs>();
      return _i72.WrappedRoute(
          child: _i67.SurveyDetailPage(
        key: args.key,
        id: args.id,
      ));
    },
  );
}

class SurveyDetailRouteArgs {
  const SurveyDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i73.Key? key;

  final int id;

  @override
  String toString() {
    return 'SurveyDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i68.UserConfMenuEditPage]
class UserConfMenuEditRoute extends _i72.PageRouteInfo<void> {
  const UserConfMenuEditRoute({List<_i72.PageRouteInfo>? children})
      : super(
          UserConfMenuEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserConfMenuEditRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i68.UserConfMenuEditPage();
    },
  );
}

/// generated route for
/// [_i69.WeatherQualityPage]
class WeatherQualityRoute extends _i72.PageRouteInfo<void> {
  const WeatherQualityRoute({List<_i72.PageRouteInfo>? children})
      : super(
          WeatherQualityRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherQualityRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      return const _i69.WeatherQualityPage();
    },
  );
}

/// generated route for
/// [_i70.WebViewSpidAuthPage]
class WebViewSpidAuthRoute
    extends _i72.PageRouteInfo<WebViewSpidAuthRouteArgs> {
  WebViewSpidAuthRoute({
    _i73.Key? key,
    required String urlSpid,
    required String municipalityId,
    required String authSystem,
    required bool ecoattivi,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          WebViewSpidAuthRoute.name,
          args: WebViewSpidAuthRouteArgs(
            key: key,
            urlSpid: urlSpid,
            municipalityId: municipalityId,
            authSystem: authSystem,
            ecoattivi: ecoattivi,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewSpidAuthRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebViewSpidAuthRouteArgs>();
      return _i72.WrappedRoute(
          child: _i70.WebViewSpidAuthPage(
        key: args.key,
        urlSpid: args.urlSpid,
        municipalityId: args.municipalityId,
        authSystem: args.authSystem,
        ecoattivi: args.ecoattivi,
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
    required this.ecoattivi,
  });

  final _i73.Key? key;

  final String urlSpid;

  final String municipalityId;

  final String authSystem;

  final bool ecoattivi;

  @override
  String toString() {
    return 'WebViewSpidAuthRouteArgs{key: $key, urlSpid: $urlSpid, municipalityId: $municipalityId, authSystem: $authSystem, ecoattivi: $ecoattivi}';
  }
}

/// generated route for
/// [_i71.WelcomePage]
class WelcomeRoute extends _i72.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i73.Key? key,
    required int municipalityId,
    List<_i72.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            municipalityId: municipalityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i72.PageInfo page = _i72.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WelcomeRouteArgs>();
      return _i72.WrappedRoute(
          child: _i71.WelcomePage(
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

  final _i73.Key? key;

  final int municipalityId;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, municipalityId: $municipalityId}';
  }
}
