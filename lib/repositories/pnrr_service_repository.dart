import 'package:logger/logger.dart';
import 'package:municipium/model/pnrr/body_pnrr.dart';
import 'package:municipium/model/pnrr/body_pnrr_response.dart';
import 'package:municipium/model/pnrr/service_pnrr.dart';
import 'package:municipium/services/network/api/pnrr_service/pnrr_service.dart';
import 'package:municipium/services/network/dto/pnrr_body_dto.dart';
import 'package:municipium/services/network/dto/service_pnrr_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PnrrServiceRepository {
  final DTOMapper<ServicePnrrDTO, ServicePnrr> pnrrMapper;
  final DTOMapper<PnrrBodyResponseDto, BodyPnrrResponse> pnrrBodyMapper;
  final PnrrService pnrrService;
  final Logger logger;

  PnrrServiceRepository(
      {required this.pnrrMapper,
      required this.pnrrBodyMapper,
      required this.pnrrService,
      required this.logger});

  Future<List<ServicePnrr>> getServicesPnrrList(String type) async {
    try {
      final servicesListResponse = await pnrrService.getServices(type);
      List<ServicePnrr> list = [];
      if (servicesListResponse.topics != null) {
        for (var element in servicesListResponse.topics!) {
          final servicesListItem = pnrrMapper.fromDTO(element);
          list.add(servicesListItem);
        }
      }
      return list;
    } catch (error) {
      logger.e('Error in getting news list');
      rethrow;
    }
  }

  Future<BodyPnrrResponse> getBodyPnrrResponse(String type, int id) async {
    try {
      final response = await pnrrService.getPnrrDetail(type, id);
      return pnrrBodyMapper.fromDTO(response);
    } catch (error) {
      logger.e('errore: ${error.toString()}');
      rethrow;
    }
  }
}
