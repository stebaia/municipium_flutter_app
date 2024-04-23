import 'package:flutter/material.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/utils/enum.dart';

class UtilityHelper {
  static List<MenuItem> getIterableMenu(Municipality municipality) {
    List<MenuItem> list = [];
    if (municipality.new_menu.news != null) {
      list.add(MenuItem.news);
    }
    if (municipality.new_menu.issue != null) {
      list.add(MenuItem.issue);
    }
    if (municipality.new_menu.penalties != null) {
      list.add(MenuItem.penalties);
    }
    if (municipality.new_menu.surveys != null) {
      list.add(MenuItem.surveys);
    }
    if (municipality.new_menu.garbage != null) {
      list.add(MenuItem.garbage);
    }
    if (municipality.new_menu.ecoattivi != null) {
      list.add(MenuItem.ecoattivi);
    }
    if (municipality.new_menu.poi != null) {
      list.add(MenuItem.poi);
    }
    if (municipality.new_menu.services != null) {
      list.add(MenuItem.services);
    }
    if (municipality.new_menu.dms != null) {
      list.add(MenuItem.dms);
    }
    if (municipality.new_menu.digitalDossier != null) {
      list.add(MenuItem.digitalDossier);
    }
    if (municipality.new_menu.civilDefence != null) {
      list.add(MenuItem.digitalDossier);
    }
    if (municipality.new_menu.payment != null) {
      list.add(MenuItem.payment);
    }
    return list;
  }

  static IconData getMenuIcon(MenuItem item) {
    switch (item) {
      case MenuItem.news:
        return Icons.newspaper;
      case MenuItem.issue:
        return Icons.notifications;
      case MenuItem.penalties:
        return Icons.article;
      case MenuItem.surveys:
        return Icons.assessment;
      case MenuItem.garbage:
        return Icons.delete;
      case MenuItem.ecoattivi:
        return Icons.thumb_up;
      case MenuItem.poi:
        return Icons.place;
      case MenuItem.services:
        return Icons.people;
      case MenuItem.dms:
        return Icons.luggage;
      case MenuItem.digitalDossier:
        return Icons.calculate;
      case MenuItem.civilDefence:
        return Icons.warning;
      case MenuItem.payment:
        return Icons.payment;
    }
  }

  static String getMenuName(MenuItem item) {
    switch (item) {
      case MenuItem.news:
        return 'News';
      case MenuItem.issue:
        return 'Segnalazioni';
      case MenuItem.penalties:
        return 'Multe';
      case MenuItem.surveys:
        return 'Sondaggi';
      case MenuItem.garbage:
        return 'Rifiuti';
      case MenuItem.ecoattivi:
        return 'Ecoattivi';
      case MenuItem.poi:
        return 'Punti d\'interesse';
      case MenuItem.services:
        return 'Servizi online';
      case MenuItem.dms:
        return 'Turismo';
      case MenuItem.digitalDossier:
        return '';
      case MenuItem.civilDefence:
        return 'Protezione civile';
      case MenuItem.payment:
        return 'Pagamenti';
    }
  }
}
