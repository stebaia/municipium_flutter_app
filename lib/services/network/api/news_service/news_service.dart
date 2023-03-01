import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'news_service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio, {String baseUrl}) = _NewsService;

  @GET('news/{newsId}')
  Future<NewsDTO> getNewsDetail(
      @Path('newsId') int newsId);

  @GET('news/')
  Future<List<NewsDTO>> getNewsList();
}