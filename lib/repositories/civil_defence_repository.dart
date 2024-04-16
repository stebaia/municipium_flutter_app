import 'package:logger/logger.dart';
import 'package:municipium/model/civil_defence/civil_defence_emergency_call.dart';
import 'package:municipium/services/network/api/civil_defence_service/civil_defence_service.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
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

  Future<List<CivilDefenceEmergencyCall>> getCivilDefenceList() async {
    try {
      final List<CivilDefenceEmergencyCallDTO>
          civilDefenceEmergencyCallResponse =
          await civilDefenceService.getPhoneNumbers();
      final List<CivilDefenceEmergencyCall> list = [];
      civilDefenceEmergencyCallResponse.forEach((element) {
        list.add(emergencyCallMapper.fromDTO(element));
      });
      return list;
    } catch (error, stackTrace) {
      logger.e('Error in getting news list');
      rethrow;
    }
  }
}
