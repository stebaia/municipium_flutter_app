import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:municipium/bloc/cubit/calendar_filter_cubit/calendar_filter_cubit.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';

class CalendarUtility {
  static List<int> filterList = [1, 2, 3, 4, 5];
  static List<int> getFilter = [];

  static Color getColorFromType(int type) {
    switch (type) {
      case 1:
        return Colors.blue;

      case 2:
        return Colors.cyan;

      case 3:
        return Colors.green;

      case 4:
        return Colors.brown;

      case 5:
        return Colors.amber;

      default:
        return Colors.blue;
    }
  }

  static String getIntFromFilter(Set<FilterType> types) {
  List<int> getFilter = [];

  for (var type in types) {
    switch (type) {
      case FilterType.news:
        getFilter.add(1);
        break;
      case FilterType.eventi:
        getFilter.add(2);
        break;
      case FilterType.rifiuti:
        getFilter.add(3);
        break;
      case FilterType.emergenze:
        getFilter.add(4);
        break;
      case FilterType.prenotazioni:
        getFilter.add(5);
        break;
      default:
        getFilter.add(1); // Valore di default
        break;
    }
  }

  // Restituisce la lista concatenata in una stringa separata da virgola
  return getFilter.join(',');
}

  static String getNameFromType(int type) {
    switch (type) {
      case 1:
        return 'Eventi';

      case 2:
        return 'News';

      case 3:
        return 'Rifiuti';

      case 4:
        return 'Protezione civile';

      case 5:
        return 'Prenotazioni';

      default:
        return 'News';
    }
  }

  static FilterType getFilterFromType(int type) {
    switch (type) {
      case 1:
        return FilterType.news;

      case 2:
        return FilterType.eventi;

      case 3:
        return FilterType.rifiuti;

      case 4:
        return FilterType.emergenze;

      case 5:
        return FilterType.prenotazioni;

      default:
        return FilterType.news;
    }
  }
}

class GroupedEvents {
    final DateTime date;
    final List<CalendarEvent> events;

    GroupedEvents({required this.date, required this.events});
  }
