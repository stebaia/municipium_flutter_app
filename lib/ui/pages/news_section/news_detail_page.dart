import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/news_detail_bloc/news_detail_bloc.dart';


@RoutePage()
class NewsDetailPage extends StatefulWidget implements AutoRouteWrapper{

  final int newsId;
  const NewsDetailPage({super.key, required this.newsId});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<NewsDetailBloc>(
          create: (context) =>
              NewsDetailBloc(newsRepository: context.read())..fetchNewsDetail(newsId),
        )
      ], child: this);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsDetailBloc, NewsDetailState>(
        builder: (context, state) {
          if(state is FetchingNewsDetailState){
            return const CircularProgressIndicator();
          }else if(state is FetchedNewsDetailState){
            return Container(
        child: Center(
          child:Text(state.newsDetail.content)
        ),
      );
          }else {
            return Center(
              child: Text(
                'Errore'
              ),
            );
          }
        },
      )
    );
  }
}