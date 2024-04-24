import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/news_detail_bloc/news_detail_bloc.dart';
import 'package:municipium/model/news_detail.dart';
import 'package:municipium/ui/components/detail_image_box.dart';
import 'package:municipium/utils/municipium_utility.dart';

@RoutePage()
class NewsDetailPage extends StatefulWidget implements AutoRouteWrapper {
  final int newsId;
  const NewsDetailPage({super.key, required this.newsId});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<NewsDetailBloc>(
          create: (context) => NewsDetailBloc(newsRepository: context.read())
            ..fetchNewsDetail(newsId),
        )
      ], child: this);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<NewsDetailBloc, NewsDetailState>(
          builder: (context, state) {
            if (state is FetchingNewsDetailState) {
              return const CircularProgressIndicator();
            } else if (state is FetchedNewsDetailState) {
              return SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.newsDetail.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 28)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined),
                          const SizedBox(width: 8),
                          Text(
                              MunicipiumUtility.convertDate(
                                  state.newsDetail.publishedAt, 'dd.MM.yyyy'),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 17))
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 250,
                        child: (state.newsDetail.images != null &&
                                state.newsDetail.images!.isNotEmpty)
                            ? PageView.builder(
                                itemCount: state.newsDetail.images!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return DetailImageBox(
                                      baseUrl: state
                                          .newsDetail.images![index].baseUrl,
                                      url: state.newsDetail.images![index]
                                          .i1920x1280);
                                },
                              )
                            : DetailImageBox(
                                baseUrl: state.newsDetail.image.baseUrl,
                                url: state.newsDetail.image.i1920x1280),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(state.newsDetail.content,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17)),
                      const SizedBox(
                        height: 24,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      checkAndCreateRow(
                          state.newsDetail.address, Icons.location_on_outlined,
                          () {
                        MunicipiumUtility.launchMapUrl(
                            state.newsDetail.address!);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      checkAndCreateRow(state.newsDetail.url, Icons.link, () {
                        MunicipiumUtility.launch(state.newsDetail.url!);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('Errore'),
              );
            }
          },
        ));
  }

  Widget checkAndCreateRow(
      String? stringToCheck, IconData icon, Function()? tap) {
    return stringToCheck != null
        ? GestureDetector(
            onTap: tap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Text(stringToCheck,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13))),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
          )
        : Container();
  }
}
