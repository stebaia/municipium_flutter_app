import 'package:logger/logger.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/api/municipality_service/municipality_service.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:pine/utils/mapper.dart';

class MunicipalityRepository {
  final MunicipalityService municipalityService;
  final DTOMapper<MunicipalityDTO, Municipality> municipalityMapper;
  final Logger logger;

  MunicipalityRepository({
    required this.municipalityService,
    required this.municipalityMapper,
    required this.logger
  });

  Future<Municipality> getMunicipality(int municipalityId) async {
    try {
      final municipalityResponse = await municipalityService.getMunicipality(municipalityId);
      return municipalityMapper.fromDTO(municipalityResponse);
    }catch(error, stackTrace){
      logger.e('Error in getting municipality', error, stackTrace);
      rethrow;
    }
  }

}