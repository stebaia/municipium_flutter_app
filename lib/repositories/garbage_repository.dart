import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:municipium/model/garbage/garbage_calendar.dart';
import 'package:municipium/model/garbage/garbage_calendar_element.dart';
import 'package:municipium/model/garbage/garbage_collection.dart';
import 'package:municipium/model/garbage/garbage_detail_calendar.dart';
import 'package:municipium/services/network/api/garbage_service/garbage_service.dart';
import 'package:municipium/services/network/dto/garbage_calendar_dto.dart';
import 'package:municipium/services/network/dto/garbage_calendar_element_dto.dart';
import 'package:municipium/services/network/dto/poi_detail_dto.dart';
import 'package:pine/pine.dart';

class GarbageRepository {
  final GarbageService service;
  final Logger logger;
  final DTOMapper<GarbageCalendarsDTO, GarbageCalendars> mapperCalendar;
  final DTOMapper<CalendarElementDTO, GarbageCalendarElement>
      mapperCalendarElement;
  GarbageRepository(
      {required this.mapperCalendar,
      required this.mapperCalendarElement,
      required this.service,
      required this.logger});

  Future<List<GarbageCalendars>> getGarbageCalendarsList(
    String baseUrl,
  ) async {
    try {
      final garbageCalendarsResponse =
          await service.getGarbageCalendars(baseUrl);
      final List<GarbageCalendars> garbageCalendarsList = [];
      if (garbageCalendarsResponse.isNotEmpty) {
        for (var element in garbageCalendarsResponse) {
          garbageCalendarsList.add(mapperCalendar.fromDTO(element));
        }
      }
      return garbageCalendarsList;
    } catch (error) {
      logger.e('Error in getting reservations units list');
      rethrow;
    }
  }

  Future<List<GarbageDetailCalendar>> getGarbageDetailCalendars(
      String baseUrl, String id, String start, String end) async {
    try {
      final garbageResponse = await service.getGarbage(baseUrl, id, start, end);
      return garbageResponse;
    } catch (error) {
      logger.e('Error in getting reservations units list');
      rethrow;
    }
  }

  Future<List<PoiDetailDTO>> getRecyclingAreas(
      String baseUrl,) async {
    try {
      final garbageResponse = await service.getRecyclingAreas(baseUrl);
      return garbageResponse;
    } catch (error) {
      logger.e('Error in getting reservations units list');
      rethrow;
    }
  }

  Future<List<WrappedGarbageCalendars>> getGarbageCategoriesList(
    String baseUrl,
  ) async {
    try {
      final garbageResponse = await service.getGarbageCategoriesURL(baseUrl);
      final List<WrappedGarbageCalendars> garbageList = [];
      final List<GarbageCalendarElement> elementMacroList = [];
      for (var element in garbageResponse) {
        elementMacroList.add(mapperCalendarElement.fromDTO(element));
      }

      for (var g in elementMacroList) {
        if (g.garbageCalendars.isNotEmpty) {
          for (var element in g.garbageCalendars) {
            garbageList.add(WrappedGarbageCalendars(parentId: g.id, garbageCalendars: element));
          }
        }
      }

      return garbageList;
    } catch (error) {
      logger.e('Error in getting garbage categories units list');
      rethrow;
    }
  }

  Future<GarbageCalendarElement> getGarbageCalendarElement(
      String baseUrl, int id) async {
    try {
      final garbageResponse =
          await service.getGarbageSubCategoriesURL(baseUrl, id.toString());
      return mapperCalendarElement.fromDTO(garbageResponse);
    } catch (error) {
      logger.e('Error in getting reservations units list');
      rethrow;
    }
  }


  Future<GarbageCollection> getGarbageCollection(
      String baseUrl) async {
    try {
      final garbageResponse =
          await service.getGarbageCollections(baseUrl);
      return garbageResponse;
    } catch (error) {
      logger.e('Error in getting reservations units list');
      rethrow;
    }
  }
}
