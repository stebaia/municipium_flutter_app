import 'package:municipium/model/menu/submenu_type.dart';

enum MenuItemType {
  news,
  events,
  issue,
  penalties,
  surveys,
  garbage,
  ecoattivi,
  poi,
  services,
  dms,
  digitalDossier,
  civilDefence,
  payment
}

class SubMenuItemType {}

enum GarbageMenuType implements SubMenuItemType {
  recyclyngAreas,
  garbageCollectors,
  garbageCalendars,
  garbageCategories
}

enum CivilDefenceType implements SubMenuItemType {
  civilDefencePhoneNumbers,
  civilDefenceLevels,
  civilDefenceAlertNews,
  civilDefenceInformations,
  civilDefenceAreUReady
}

enum DmsType implements SubMenuItemType { eatery, host, poi, experience }
