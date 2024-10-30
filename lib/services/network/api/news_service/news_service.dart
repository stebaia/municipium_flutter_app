import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'news_service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio) = _NewsService;

  @GET('{baseUrl}/news/{newsId}')
  Future<NewsDTO> getNewsDetail(
      @Path('baseUrl') String baseUrl, @Path('newsId') int newsId);

  @GET(
      '{baseUrl}/news/paged_news?page_index={page_index}&page_size={page_size}')
  Future<NewsPagedDto> getNewsList(@Path('baseUrl') String baseUrl,
      @Path('page_index') int page_index, @Path('page_size') int page_size);
}
