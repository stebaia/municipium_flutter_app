import 'package:flutter/material.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/utils/enum.dart';

class UtilityHelper {
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

  static String getMenuName(MenuItem item) {
    switch (item.type) {
      case MenuItemType.news:
        return 'News';
      case MenuItemType.issue:
        return 'Segnalazioni';
      case MenuItemType.penalties:
        return 'Multe';
      case MenuItemType.surveys:
        return 'Sondaggi';
      case MenuItemType.garbage:
        return 'Rifiuti';
      case MenuItemType.ecoattivi:
        return 'Ecoattivi';
      case MenuItemType.poi:
        return 'Punti d\'interesse';
      case MenuItemType.services:
        return 'Servizi online';
      case MenuItemType.dms:
        return 'Turismo';
      case MenuItemType.digitalDossier:
        return '';
      case MenuItemType.civilDefence:
        return 'Protezione civile';
      case MenuItemType.payment:
        return 'Pagamenti';
    }
  }
}
