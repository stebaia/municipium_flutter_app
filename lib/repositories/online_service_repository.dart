import 'package:logger/logger.dart';
import 'package:municipium/model/online_service/online_service.dart';
import 'package:municipium/services/network/api/online_service_service/online_service_service.dart';

class OnlineServiceRepository {
  final OnlineServiceService onlineServiceService;
  final Logger logger;

  OnlineServiceRepository({
    required this.onlineServiceService,
    required this.logger
  });
  
  Future<List<OnlineService>> getListOnlineService() async {
    try {
      final listOnlineService =
          await onlineServiceService.getServices();
      return listOnlineService;
    } catch (error) {
      logger.e('Error in getting service list');
      rethrow;
    }
  }

}