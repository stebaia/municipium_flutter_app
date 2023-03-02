import 'package:logger/logger.dart';
import 'package:municipium/model/news_detail.dart';
import 'package:municipium/model/news_item_list.dart';
import 'package:municipium/services/network/api/news_service/news_service.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:pine/utils/mapper.dart';

class NewsRepository {
  final DTOMapper<NewsDTO, NewsItemList> newsItemMapper;
  final DTOMapper<NewsDTO, NewsDetail> newsDetailMapper;
  final NewsService newsService;
  final Logger logger;
  
  NewsRepository({
    required this.logger,
    required this.newsService,
    required this.newsItemMapper,
    required this.newsDetailMapper
  });

 

  Future<List<NewsItemList>> getNewsList() async {
    try {
      final List<NewsDTO> newsListResponse = await newsService.getNewsList();
      final List<NewsItemList> newsList = [];
      newsListResponse.forEach((element) {
        newsList.add(newsItemMapper.fromDTO(element));
      });
      return newsList;
    } catch (error, stackTrace) {
      logger.e('Error in getting news list', error, stackTrace);
      rethrow;
    }
  }

  Future<NewsDetail> getNewsDetail(int newsId) async {
    try{
      final newsDetailResponse = await newsService.getNewsDetail(newsId);
      final newsDetail = newsDetailMapper.fromDTO(newsDetailResponse);
      return newsDetail;
    }catch (error, stackTrace) {
      logger.e('Error in getting news $newsId', error, stackTrace);
      rethrow;
    }
  }

}
