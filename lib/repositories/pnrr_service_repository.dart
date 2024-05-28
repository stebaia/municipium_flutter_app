import 'package:logger/logger.dart';
import 'package:municipium/model/pnrr/service_pnrr.dart';
import 'package:municipium/services/network/api/pnrr_service/pnrr_service.dart';
import 'package:municipium/services/network/dto/service_pnrr_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PnrrServiceRepository {
  final DTOMapper<ServicePnrrDTO, ServicePnrr> pnrrMapper;
  final PnrrService pnrrService;
  final Logger logger;

  PnrrServiceRepository(
      {required this.pnrrMapper,
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
}
