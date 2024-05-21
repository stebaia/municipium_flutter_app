import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/services/network/dto/poi_detail_dto.dart';

@RoutePage()
class DetailPoiPage extends StatelessWidget implements AutoRouteWrapper {
  const DetailPoiPage({super.key, required this.poiId});

  final int poiId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
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
                  children: [
                    Text(
                      state.poiDetailDTO.name!,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    _buildRowArgument(state.poiDetailDTO),
                    _buildRowCategories(state.poiDetailDTO),
                    _buildImages(state.poiDetailDTO)
                  ],
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

  Widget _buildImages(PoiDetailDTO poiDetailDTO) {
    if (poiDetailDTO.images != null) {
      if (poiDetailDTO.images!.isNotEmpty) {
        return CarouselSlider(
          options: CarouselOptions(),
          items: poiDetailDTO.images!
              .map((item) => Container(
                    child: Center(
                        child: Image.network(item.i640!,
                            fit: BoxFit.cover, width: 1000)),
                  ))
              .toList(),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget _buildRowCategories(PoiDetailDTO poiDetailDTO) {
    if (poiDetailDTO.pointOfInterestCategories != null) {
      if (poiDetailDTO.pointOfInterestCategories!.isNotEmpty) {
        return Row(
          children: [
            Text(
              poiDetailDTO.pointOfInterestCategories!
                  .map((cat) => cat.name)
                  .join(' - ')
                  .toUpperCase(),
              style: const TextStyle(
                  fontSize: 12, color: Colors.grey, letterSpacing: 1),
            )
          ],
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget _buildRowArgument(PoiDetailDTO poiDetailDTO) {
    if (poiDetailDTO.argomenti != null) {
      if (poiDetailDTO.argomenti!.isNotEmpty) {
        return Row(
          children: [
            Text(
              poiDetailDTO.argomenti!
                  .map((argument) => argument.name)
                  .join(' - ')
                  .toUpperCase(),
              style: const TextStyle(
                  fontSize: 12, color: Colors.grey, letterSpacing: 1),
            )
          ],
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
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
