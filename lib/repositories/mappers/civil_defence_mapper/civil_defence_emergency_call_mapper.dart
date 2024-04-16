import 'package:municipium/model/civil_defence/civil_defence_emergency_call.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:pine/pine.dart';

class CivilDefenceEmergencyCallMapper
    extends DTOMapper<CivilDefenceEmergencyCallDTO, CivilDefenceEmergencyCall> {
  @override
  CivilDefenceEmergencyCall fromDTO(CivilDefenceEmergencyCallDTO dto) =>
      CivilDefenceEmergencyCall(
          id: dto.id ?? 0, name: dto.name ?? '', number: dto.number ?? '');

  @override
  CivilDefenceEmergencyCallDTO toDTO(CivilDefenceEmergencyCall model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}
