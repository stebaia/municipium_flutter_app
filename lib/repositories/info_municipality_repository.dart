import 'package:logger/logger.dart';
import 'package:municipium/model/pages/pages.dart';
import 'package:municipium/services/network/api/info_municipality_service/info_municipality_service.dart';

class InfoMunicipalityRepository {
  
  final InfoMunicipalityService service;
  final Logger logger;

  InfoMunicipalityRepository(
      {
      required this.service,
      required this.logger});

  Future<List<Pages>> getPageList(
      String baseUrl) async {
    try {

      final pagesResponse = await service.getPages(baseUrl,);
      List<Pages> list = pagesResponse;
      return list;
    } catch (error) {
      logger.e('Error in getting pages list');
      rethrow;
    }
  }

  Future<Pages> getPageDetail(
      String baseUrl, int id ) async {
    try {
      
      final pageDetailResponse = await service.getPageDetail(baseUrl, id);
      return pageDetailResponse;
    } catch (error) {
      logger.e('Error in getting page detail');
      rethrow;
    }
  }

}
