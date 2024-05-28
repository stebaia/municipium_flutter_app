import 'package:dio/dio.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'news_service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio, {String baseUrl}) = _NewsService;

  @GET('news/{newsId}')
  Future<NewsDTO> getNewsDetail(@Path('newsId') int newsId);

  @GET('news/paged_news?page_index={page_index}&page_size={page_size}')
  Future<NewsPagedDto> getNewsList(
      @Path('page_index') int page_index, @Path('page_size') int page_size);
}
