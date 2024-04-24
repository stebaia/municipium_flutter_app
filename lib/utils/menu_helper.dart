import 'package:flutter/material.dart';
import 'package:municipium/model/menu/menu_item.dart';
import 'package:municipium/model/menu/submenu_type.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/dto/civil_defence_dto.dart';
import 'package:municipium/services/network/dto/dms_dto.dart';
import 'package:municipium/services/network/dto/garbage_dto.dart';
import 'package:municipium/utils/enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuHelper {
  static List<MenuItem> getIterableMenu(Municipality municipality) {
    List<MenuItem> list = [];
    if (municipality.new_menu.news != null) {
      list.add(MenuItem(type: MenuItemType.news));
    }
    if (municipality.new_menu.issue != null) {
      list.add(MenuItem(type: MenuItemType.issue));
    }
    if (municipality.new_menu.penalties != null) {
      list.add(MenuItem(type: MenuItemType.penalties));
    }
    if (municipality.new_menu.surveys != null) {
      list.add(MenuItem(type: MenuItemType.surveys));
    }
    if (municipality.new_menu.garbage != null) {
      list.add(MenuItem(
          type: MenuItemType.garbage, subMenu: municipality.new_menu.garbage));
    }
    if (municipality.new_menu.ecoattivi != null) {
      list.add(MenuItem(type: MenuItemType.ecoattivi));
    }
    if (municipality.new_menu.poi != null) {
      list.add(MenuItem(type: MenuItemType.poi));
    }
    if (municipality.new_menu.services != null) {
      list.add(MenuItem(type: MenuItemType.services));
    }
    if (municipality.new_menu.dms != null) {
      list.add(
          MenuItem(type: MenuItemType.dms, subMenu: municipality.new_menu.dms));
    }
    if (municipality.new_menu.civilDefence != null) {
      list.add(MenuItem(
          type: MenuItemType.civilDefence,
          subMenu: municipality.new_menu.civilDefence));
    }
    if (municipality.new_menu.payment != null) {
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
        return '';
      case MenuItemType.civilDefence:
        return AppLocalizations.of(context)!.civil_defence_menu;
      case MenuItemType.payment:
        return AppLocalizations.of(context)!.payment_menu;
    }
  }
}
