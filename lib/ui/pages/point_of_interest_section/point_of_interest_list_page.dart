import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/model/point_of_interests_item.dart';

class PointOfInterestListPage extends StatefulWidget with AutoRouteWrapper {
  const PointOfInterestListPage({super.key});

  @override
  State<PointOfInterestListPage> createState() => _PointOfInterestListPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PointOfInterestListBloc>(
          create: (context) =>
              PointOfInterestListBloc(pointOfInterestRepository: context.read())..fetchPointOfInterestList(),
        )
      ], child: this);
}

class _PointOfInterestListPageState extends State<PointOfInterestListPage> {
   final List<PointOfInterestsItem> _pointOfInterestItemList = [];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        body: Container(child: BlocBuilder<PointOfInterestListBloc, PointOfInterestListState>(
      builder: (context, state) {
        if (state is FetchingPointOfInterestListState && _pointOfInterestItemList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchedPointOfInterestListState) {
          _pointOfInterestItemList.addAll(state.pointOfInterestsList.pointOfInterestsItemList!.toList());
          context.read<PointOfInterestListBloc>().isFetching = false;
        } else if (state is NoPointOfInterestListState && _pointOfInterestItemList.isEmpty) {
          return Center(
            child: Text('Nessun poi presente'),
          );
        } else if (state is ErrorPointOfInterestListState){
          return Center(
            child: Text('Errore nel download deli poi'),
          );
        }
        return ListView.builder(
              controller: _scrollController..addListener(() {if(_scrollController.offset == _scrollController.position.maxScrollExtent && !context.read<PointOfInterestListBloc>().isFetching){
                context.read<PointOfInterestListBloc>()..isFetching= true..add(const FetchPointOfInterestListEvent());
              }}),
              itemCount: _pointOfInterestItemList.length,
              itemBuilder: ((context, index) => ListTile(
               // onTap: () => context.pushRoute(NewsDetailRoute(newsId: state.newsItemList[index].id)),
                    title: Text(
                      _pointOfInterestItemList[index].name!
                    ),
                    
                  )));
      },
    )));
  }
}