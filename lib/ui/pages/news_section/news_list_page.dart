import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/news_list_bloc/news_list_bloc_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';

class NewsListPage extends StatefulWidget with AutoRouteWrapper {
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
      extendBodyBehindAppBar: true,
        body: Container(child: BlocBuilder<NewsListBloc, NewsListBlocState>(
      builder: (context, state) {
        if (state is FetchingNewsListState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchedNewsListState) {
          return ListView.builder(
              itemCount: state.newsItemList.length,
              itemBuilder: ((context, index) => ListTile(
                onTap: () => context.pushRoute(NewsDetailRoute(newsId: state.newsItemList[index].id)),
                    title: Text(
                      state.newsItemList[index].title,
                    ),
                    subtitle: Text(state.newsItemList[index].publishedAt),
                  )));
        } else if (state is NoNewsListState) {
          return Center(
            child: Text('Nessuna news presente'),
          );
        } else {
          return Center(
            child: Text('Errore nel download delle news'),
          );
        }
      },
    )));
  }
}
