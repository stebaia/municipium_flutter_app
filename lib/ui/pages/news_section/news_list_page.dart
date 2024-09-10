import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/news_list_bloc/news_list_bloc_bloc.dart';
import 'package:municipium/model/news/news_item_list.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/ui/components/detail_image_box.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:shimmer/shimmer.dart';

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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MenuDrawer(
          mContext: context,
          scaffoldKey: _scaffoldKey,
        ),
        appBar: AppBar(
          
          title: context.read<NewsListBloc>().isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Cerca...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: ((value) =>
                      context.read<NewsListBloc>().filterNewsList(value)),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.news_menu.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
          leading: IconButton(
            onPressed: () => context.router.popUntil(
                (route) => route.settings.name == CoreMunicipalityRoute.name),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  context.read<NewsListBloc>().isSearching =
                      !context.read<NewsListBloc>().isSearching;
                  if (!context.read<NewsListBloc>().isSearching) {
                    // Clear search when closing the search
                    _searchController.clear();
                    context.read<NewsListBloc>().filterNewsList('');
                  }
                });
              },
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: false,
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
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !context.read<NewsListBloc>().isFetching &&
                      !context.read<NewsListBloc>().isSearching) {
                    context.read<NewsListBloc>()
                      ..isFetching = true
                      ..add(const FetchNewsListEvent());
                  }
                }),
              itemCount: newsToShow.length,
              itemBuilder: ((context, index) => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
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
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color?>(
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
