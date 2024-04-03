import 'package:logger/logger.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/api/municipality_service/municipality_service.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:pine/utils/mapper.dart';

class MunicipalityRepository {
  final Mapper<Municipality, String> munMapper;
  final SecureStorage secureStorage;
  final MunicipalityService municipalityService;
  final DTOMapper<MunicipalityDTO, Municipality> municipalityMapper;
  final Logger logger;

  MunicipalityRepository(
      {required this.munMapper,
      required this.secureStorage,
      required this.municipalityService,
      required this.municipalityMapper,
      required this.logger});

  Future<Municipality> saveMunicipality(int municipalityId) async {
    try {
      final municipalityResponse =
          await municipalityService.getMunicipality(municipalityId);
      final municipality = municipalityMapper.fromDTO(municipalityResponse);
      await secureStorage
          .setMunicipalityKeyInStorage(munMapper.from(municipality));
      return municipality;
    } catch (error, stackTrace) {
      logger.e('Error in getting municipality');
      rethrow;
    }
  }

  Future<Municipality?> get currentMunicipality async {
    final json = await secureStorage.getMunicipalityFromStorage();
    if (json != null) {
      return munMapper.to(json);
    }
    return null;
  }
}
