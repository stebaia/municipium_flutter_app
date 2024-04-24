import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/news_list_bloc/news_list_bloc_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/ui/components/detail_image_box.dart';
import 'package:municipium/utils/municipium_utility.dart';

@RoutePage()
class NewsListPage extends StatefulWidget implements AutoRouteWrapper {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<NewsListBloc>(
          create: (context) =>
              NewsListBloc(newsRepository: context.read())..fetchNewsList(),
        )
      ], child: this);
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.news_menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        extendBodyBehindAppBar: true,
        body: Container(child: BlocBuilder<NewsListBloc, NewsListBlocState>(
          builder: (context, state) {
            if (state is FetchingNewsListState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchedNewsListState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: ListView.builder(
                    itemCount: state.newsItemList.length,
                    itemBuilder: ((context, index) => GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Column(
                            children: [
                              DetailImageBox(
                                  baseUrl:
                                      state.newsItemList[index].images.baseUrl,
                                  url: state
                                      .newsItemList[index].images.i1920x1280),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(state.newsItemList[index].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                      MunicipiumUtility.convertDate(
                                          state.newsItemList[index].publishedAt,
                                          'dd.MM.yyyy'),
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(188, 191, 200, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15))
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                  'Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, Ciao bro, '),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color?>(
                                              Colors.grey),
                                    ),
                                    child: Text(AppLocalizations.of(context)!
                                        .read_more),
                                    onPressed: () {
                                      context.pushRoute(NewsDetailRoute(
                                          newsId:
                                              state.newsItemList[index].id));
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          context.pushRoute(NewsDetailRoute(
                              newsId: state.newsItemList[index].id));
                        }))),
              );
            } else if (state is NoNewsListState) {
              return Center(
                child: Text(AppLocalizations.of(context)!.no_news_fetched),
              );
            } else {
              return Center(
                child: Text(AppLocalizations.of(context)!.error_news_fetched),
              );
            }
          },
        )));
  }
}
