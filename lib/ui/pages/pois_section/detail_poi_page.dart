import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';

@RoutePage()
class DetailPoiPage extends StatelessWidget implements AutoRouteWrapper {
  const DetailPoiPage({super.key, required this.poiId});

  final int poiId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<PointOfInterestBloc, PointOfInterestState>(
          builder: (context, state) {
            if (state is FetchingPoiDetailState) {
              return Container();
            } else if (state is FetchedPoiDetailState) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(state.poiDetailDTO.name!)],
                ),
              );
            } else {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.error_news_fetched,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ));
            }
          },
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PointOfInterestBloc>(
          create: (context) =>
              PointOfInterestBloc(pointOfInterestRepository: context.read())
                ..fetchPoiDetail(poiId),
        ),
      ], child: this);
}
