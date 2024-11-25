import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/bloc/news_list_bloc/news_list_bloc_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:municipium/model/news/news_item_list.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/detail_image_box.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CivilDefenceNewsPage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    String baseUrl =
        Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl;

    int id = context
        .read<MunicipalityStoredCubit>()
        .state!
        .civilDefenceNewsCategoryIds[0];

    return MultiBlocProvider(providers: [
      BlocProvider<NewsListBloc>(
        create: (context) => NewsListBloc(newsRepository: context.read())
          ..fetchNewsListFromCategory(
              Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl, id),
      )
    ], child: this);
  }

  const CivilDefenceNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.civil_defence_alerts.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: Container(child: BlocBuilder<NewsListBloc, NewsListBlocState>(
          builder: (context, state) {
            List<NewsItemList> newsToShow =
                (context.read<NewsListBloc>().allNews);
            if (context.read<NewsListBloc>().isSearching) {
              newsToShow = (context.read<NewsListBloc>().allNewsFiltered);
            }
            if (state is FetchingNewsListState && newsToShow.isEmpty) {
              return ShimmerUtils.buildShimmer(6);
            } else if (state is FetchedNewsListState) {
              context.read<NewsListBloc>().isFetching = false;
            } else if (state is NoNewsListState) {
              return Center(
                child: Text(AppLocalizations.of(context)!.no_news_fetched),
              );
            }
            return ListView.builder(
              itemCount: newsToShow.length,
              itemBuilder: ((context, index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailImageBox(
                            baseUrl: newsToShow[index].images.baseUrl,
                            url: newsToShow[index].images.i1920x1280,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  newsToShow[index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                MunicipiumUtility.convertDate(
                                  newsToShow[index].publishedAt,
                                  'dd.MM.yyyy',
                                ),
                                style: const TextStyle(
                                  color: Color.fromRGBO(188, 191, 200, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            newsToShow[index].description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStatePropertyAll<Color?>(
                                          ThemeHelper.blueMunicipium),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.read_more,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  context.pushRoute(NewsDetailRoute(
                                    newsId: newsToShow[index].id,
                                  ));
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      context.pushRoute(NewsDetailRoute(
                        newsId: newsToShow[index].id,
                      ));
                    },
                  )),
            );
          },
        )));
  }
}
