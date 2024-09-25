import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:municipium/bloc/cubit/calendar_filter_cubit/calendar_filter_cubit.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';

class CalendarUtility {
  static List<int> filterList = [1, 2, 3, 4, 5];

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

  static int getIntFromFilter(FilterType type) {
    switch (type) {
      case FilterType.news:
        return 1;

      case FilterType.eventi:
        return 2;

      case FilterType.rifiuti:
        return 3;
      case FilterType.emergenze:
        return 4;
      case FilterType.prenotazioni:
        return 5;
      default:
        return 1;
    }
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
