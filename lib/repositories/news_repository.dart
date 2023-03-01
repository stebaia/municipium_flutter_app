import 'package:logger/logger.dart';
import 'package:municipium/model/news_item_list.dart';
import 'package:municipium/model/news_list.dart';
import 'package:municipium/services/network/api/news_service/news_service.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:pine/utils/mapper.dart';

class NewsRepository {
  final DTOMapper<NewsDTO, NewsItemList> newsItemMapper;
  final NewsService newsService;
  final Logger logger;
  
  NewsRepository({
    required this.logger,
    required this.newsService,
    required this.newsItemMapper
  });

  Future<List<NewsItemList>> getNewsList() async {
    try{
      final List<NewsDTO> newsListResponse = await newsService.getNewsList();
      final List<NewsItemList> newsList = [];
      newsListResponse.forEach((element) {
        newsList.add(newsItemMapper.fromDTO(element));    
      });
      return newsList;
    }catch (error, stackTrace) {
      logger.e('Error in getting news list', error, stackTrace);
      rethrow;
    }
  }

}