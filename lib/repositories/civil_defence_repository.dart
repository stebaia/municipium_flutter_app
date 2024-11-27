import 'package:logger/logger.dart';
import 'package:municipium/model/civil_defence/civil_defence_are_you_ready.dart';
import 'package:municipium/model/civil_defence/civil_defence_emergency_call.dart';
import 'package:municipium/model/civil_defence/civil_defence_level.dart';
import 'package:municipium/model/civil_defence/civil_defence_list_informations.dart';
import 'package:municipium/services/network/api/civil_defence_service/civil_defence_service.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:municipium/ui/pages/civil_defence_section/civil_defence_informations_page.dart';
import 'package:pine/pine.dart';

class CivilDefenceRepository {
  final DTOMapper<CivilDefenceEmergencyCallDTO, CivilDefenceEmergencyCall>
      emergencyCallMapper;
  final CivilDefenceService civilDefenceService;
  final Logger logger;

  CivilDefenceRepository(
      {required this.emergencyCallMapper,
      required this.civilDefenceService,
      required this.logger});

  Future<List<CivilDefenceEmergencyCall>> getCivilDefenceList(
      String baseUrl) async {
    try {
      final List<CivilDefenceEmergencyCallDTO>
          civilDefenceEmergencyCallResponse =
          await civilDefenceService.getPhoneNumbers(baseUrl);
      final List<CivilDefenceEmergencyCall> list = [];
      civilDefenceEmergencyCallResponse.forEach((element) {
        list.add(emergencyCallMapper.fromDTO(element));
      });
      return list;
    } catch (error) {
      logger.e('Error in getting news list');
      rethrow;
    }
  }

  Future<CivilDefenceLevels> getCivilDefenceLevels(
      String baseUrl, String type) async {
    try {
      final CivilDefenceLevels civilDefenceLevels =
          await civilDefenceService.getCivilDefenceLevels(baseUrl, type);
      return civilDefenceLevels;
    } catch (e) {
      logger.e('Error getting civil defence levels $e');
      rethrow;
    }
  }

  Future<List<CivilDefenceAreYouReady>> getCivilDefenceAreYouReady(
      String baseUrl) async {
    try {
      final List<CivilDefenceAreYouReady> responseList =
          await civilDefenceService.getCivilDefenceAreYouReady(baseUrl);
      return responseList;
    } catch (e) {
      logger.e('Error getting civil defence levels $e');
      rethrow;
    }
  }

  Future<List<CivilDefenceListInformations>> getCivilDefenceInformations(
      String baseUrl) async {
    try {
      final List<CivilDefenceListInformations> responseList =
          await civilDefenceService.getCivilDefenceInformations(baseUrl);
      return responseList;
    } catch (e) {
      logger.e('Error getting civil defence info $e');
      rethrow;
    }
  }
}
