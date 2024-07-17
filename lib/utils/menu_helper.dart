import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/menu/menu_item.dart';
import 'package:municipium/model/menu/submenu_type.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/services/network/dto/civil_defence_dto.dart';
import 'package:municipium/services/network/dto/dms_dto.dart';
import 'package:municipium/services/network/dto/garbage_dto.dart';
import 'package:municipium/ui/pages/events_section/event_list_page.dart';
import 'package:municipium/utils/enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

class MenuHelper {
  static List<MenuItem> getIterableMenu(Municipality municipality) {
    List<MenuItem> list = [];
    if (municipality.newMenu.news != null) {
      list.add(MenuItem(type: MenuItemType.news));
    }
    if (municipality.newMenu.events != null) {
      list.add(MenuItem(type: MenuItemType.events));
    }
    if (municipality.newMenu.issue != null) {
      list.add(MenuItem(type: MenuItemType.issue));
    }
    if (municipality.newMenu.penalties != null) {
      list.add(MenuItem(type: MenuItemType.penalties));
    }
    if (municipality.newMenu.surveys != null) {
      list.add(MenuItem(type: MenuItemType.surveys));
    }
    if (municipality.newMenu.garbage != null) {
      list.add(MenuItem(
          type: MenuItemType.garbage, subMenu: municipality.newMenu.garbage));
    }
    if (municipality.newMenu.ecoattivi != null) {
      list.add(MenuItem(type: MenuItemType.ecoattivi));
    }
    if (municipality.newMenu.sportelloTelematico != null) {
      list.add(MenuItem(type: MenuItemType.sportelloTelematico));
    }
    if (municipality.newMenu.poi != null) {
      list.add(MenuItem(type: MenuItemType.poi));
    }
    if (municipality.newMenu.services != null) {
      list.add(MenuItem(type: MenuItemType.services));
    }
    if (municipality.newMenu.dms != null) {
      list.add(
          MenuItem(type: MenuItemType.dms, subMenu: municipality.newMenu.dms));
    }
    if (municipality.newMenu.civilDefence != null) {
      list.add(MenuItem(
          type: MenuItemType.civilDefence,
          subMenu: municipality.newMenu.civilDefence));
    }
    if (municipality.newMenu.payment != null) {
      list.add(MenuItem(type: MenuItemType.payment));
    }
    return list;
  }

  static List<SubMenuItemType> getIterableSubmenu(SubMenuType menu) {
    List<SubMenuItemType> list = [];
    if (menu is GarbageDTO) {
      var garbageMenu = menu;
      if (garbageMenu.recyclingAreas != null) {
        list.add(GarbageMenuType.recyclyngAreas);
      }
      if (garbageMenu.calendars != null) {
        list.add(GarbageMenuType.garbageCalendars);
      }
      if (garbageMenu.garbageCollections != null) {
        list.add(GarbageMenuType.garbageCollectors);
      }
      if (garbageMenu.garbageCategories != null) {
        list.add(GarbageMenuType.garbageCategories);
      }
    } else if (menu is CivilDefenceDTO) {
      var civilDefenceMenu = menu;
      if (civilDefenceMenu.civilDefencePhoneNumbers != null) {
        list.add(CivilDefenceType.civilDefencePhoneNumbers);
      }
      if (civilDefenceMenu.civilDefenceLevels != null) {
        list.add(CivilDefenceType.civilDefenceLevels);
      }
      if (civilDefenceMenu.civilDefenceAlertsNews != null) {
        list.add(CivilDefenceType.civilDefenceAlertNews);
      }
      if (civilDefenceMenu.civilDefenceInformations != null) {
        list.add(CivilDefenceType.civilDefenceInformations);
      }
      if (civilDefenceMenu.civilDefenceAreYouReady != null) {
        list.add(CivilDefenceType.civilDefenceAreUReady);
      }
    } else if (menu is DmsDTO) {
      var civilDefenceMenu = menu;
      if (civilDefenceMenu.eatery != null) {
        list.add(DmsType.eatery);
      }
      if (civilDefenceMenu.host != null) {
        list.add(DmsType.host);
      }
      if (civilDefenceMenu.poi != null) {
        list.add(DmsType.poi);
      }
      if (civilDefenceMenu.experience != null) {
        list.add(DmsType.experience);
      }
    }
    return list;
  }

  static IconData getMenuIcon(MenuItem item) {
    switch (item.type) {
      case MenuItemType.news:
        return Icons.newspaper;
      case MenuItemType.events:
        return Icons.event;
      case MenuItemType.issue:
        return Icons.notifications;
      case MenuItemType.penalties:
        return Icons.article;
      case MenuItemType.surveys:
        return Icons.assessment;
      case MenuItemType.garbage:
        return Icons.delete;
      case MenuItemType.ecoattivi:
        return Icons.thumb_up;
      case MenuItemType.poi:
        return Icons.place;
      case MenuItemType.services:
        return Icons.people;
      case MenuItemType.dms:
        return Icons.luggage;
      case MenuItemType.digitalDossier:
        return Icons.calculate;
      case MenuItemType.civilDefence:
        return Icons.warning;
      case MenuItemType.payment:
        return Icons.payment;
      case MenuItemType.sportelloTelematico:
        return Icons.perm_contact_calendar;
    }
  }

  static IconData? getSubMenuIcon(SubMenuItemType type) {
    switch (type) {
      case GarbageMenuType.recyclyngAreas:
        return Icons.view_in_ar;
      case GarbageMenuType.garbageCollectors:
        return Icons.monitor;
      case GarbageMenuType.garbageCalendars:
        return Icons.calendar_month;
      case GarbageMenuType.garbageCategories:
        return Icons.monitor;
      case CivilDefenceType.civilDefencePhoneNumbers:
        return Icons.phone;
      case CivilDefenceType.civilDefenceLevels:
        return Icons.warning;
      case CivilDefenceType.civilDefenceInformations:
        return Icons.info;
      case CivilDefenceType.civilDefenceAlertNews:
        return Icons.newspaper;
      case CivilDefenceType.civilDefenceAreUReady:
        return Icons.help;
      case DmsType.eatery:
        return Icons.food_bank;
      case DmsType.host:
        return Icons.hotel;
      case DmsType.poi:
        return Icons.location_on;
      case DmsType.experience:
        return Icons.explore_rounded;
    }
    return null;
  }

  static String? getSubMenuName(BuildContext context, SubMenuItemType type) {
    switch (type) {
      case GarbageMenuType.recyclyngAreas:
        return AppLocalizations.of(context)?.recycling_areas_menu;
      case GarbageMenuType.garbageCollectors:
        return AppLocalizations.of(context)?.garbage_collections_menu;
      case GarbageMenuType.garbageCalendars:
        return AppLocalizations.of(context)?.calendar_menu;
      case GarbageMenuType.garbageCategories:
        return AppLocalizations.of(context)?.garbage_categories_menu;
      case CivilDefenceType.civilDefencePhoneNumbers:
        return AppLocalizations.of(context)?.civil_defence_phone_numbers;
      case CivilDefenceType.civilDefenceLevels:
        return AppLocalizations.of(context)?.civil_defence_alerts;
      case CivilDefenceType.civilDefenceInformations:
        return AppLocalizations.of(context)?.civil_defence_info;
      case CivilDefenceType.civilDefenceAlertNews:
        return AppLocalizations.of(context)?.civil_defence_advice;
      case CivilDefenceType.civilDefenceAreUReady:
        return AppLocalizations.of(context)?.civil_defence_are_u_ready;
      case DmsType.eatery:
        return AppLocalizations.of(context)?.dms_eatery;
      case DmsType.host:
        return AppLocalizations.of(context)?.dms_host;
      case DmsType.poi:
        return AppLocalizations.of(context)?.dms_poi;
      case DmsType.experience:
        return AppLocalizations.of(context)?.dms_experience;
    }
    return null;
  }

  static String getMenuName(BuildContext context, MenuItem item) {
    switch (item.type) {
      case MenuItemType.news:
        return AppLocalizations.of(context)!.news_menu;
      case MenuItemType.events:
        return AppLocalizations.of(context)!.events_menu;
      case MenuItemType.issue:
        return AppLocalizations.of(context)!.issue_menu;
      case MenuItemType.penalties:
        return AppLocalizations.of(context)!.penalties_menu;
      case MenuItemType.surveys:
        return AppLocalizations.of(context)!.surveys_menu;
      case MenuItemType.garbage:
        return AppLocalizations.of(context)!.garbage_menu;
      case MenuItemType.ecoattivi:
        return AppLocalizations.of(context)!.ecoattivi_menu;
      case MenuItemType.poi:
        return AppLocalizations.of(context)!.poi_menu;
      case MenuItemType.services:
        return AppLocalizations.of(context)!.services_menu;
      case MenuItemType.dms:
        return AppLocalizations.of(context)!.dms_menu;
      case MenuItemType.digitalDossier:
        return AppLocalizations.of(context)!.digital_dossier_menu;
      case MenuItemType.civilDefence:
        return AppLocalizations.of(context)!.civil_defence_menu;
      case MenuItemType.payment:
        return AppLocalizations.of(context)!.payment_menu;
      case MenuItemType.sportelloTelematico:
        return AppLocalizations.of(context)!.sportello_telematico_menu;
    }
  }

  static void checkAndPushRoute(BuildContext context, MenuItem menuItem) async {
    switch (menuItem.type) {
      case MenuItemType.news:
        context.pushRoute(const NewsListRoute());
        break;
      case MenuItemType.events:
        context.pushRoute(const EventListRoute());
        break;
      case MenuItemType.issue:
        DeviceBe? deviceBe = await context.read<MunicipalityBloc>().getDevice();
        context.pushRoute(IssuesListRoute(udid: deviceBe!.udid));
        break;
      case MenuItemType.penalties:
        // TODO: Handle this case.
        break;
      case MenuItemType.surveys:
        // TODO: Handle this case.
        break;
      case MenuItemType.garbage:
        // TODO: Handle this case.
        break;
      case MenuItemType.ecoattivi:
        // TODO: Handle this case.
        break;
      case MenuItemType.poi:
        // TODO: Handle this case.
        break;
      case MenuItemType.services:
        // TODO: Handle this case.
        break;
      case MenuItemType.dms:
        // TODO: Handle this case.
        break;
      case MenuItemType.digitalDossier:
        // TODO: Handle this case.
        break;
      case MenuItemType.civilDefence:
        // TODO: Handle this case.
        break;
      case MenuItemType.payment:
        // TODO: Handle this case.
        break;
      case MenuItemType.sportelloTelematico:
        context.pushRoute(PnrrServicesRoute(type: 'services'));
    }
  }
}
