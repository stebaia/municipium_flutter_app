import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:municipium/bloc/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/services/network/dto/poi_detail_dto.dart';
import 'package:municipium/ui/components/row_pnnr_components/row_contact_point.dart';
import 'package:municipium/ui/components/row_pnnr_components/row_pnnr_component.dart';
import 'package:municipium/ui/components/shimmers/shimmer_detail_component.dart';

@RoutePage()
class DetailPoiPage extends StatelessWidget implements AutoRouteWrapper {
  const DetailPoiPage({super.key, required this.poiId});

  final int poiId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PointOfInterestBloc, PointOfInterestState>(
          builder: (context, state) {
            if (state is FetchedPoiDetailState) {
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
                    const SizedBox(
                      height: 10,
                    ),
                    _buildOpenDataLogo(state.poiDetailDTO),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildImages(state.poiDetailDTO),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildDescription(state.poiDetailDTO),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildRowElement(
                      Icons.place,
                      state.poiDetailDTO.address,
                      () => MapsLauncher.launchCoordinates(
                          double.parse(state.poiDetailDTO.latitude!),
                          double.parse(state.poiDetailDTO.longitude!)),
                    ),
                    buildRowElement(
                        Icons.place, state.poiDetailDTO.openingTimes, null),
                    buildRowElementLink(
                        CupertinoIcons.link, state.poiDetailDTO.webSite),
                    buildRowElement(Icons.accessible,
                        state.poiDetailDTO.modalitaAccesso, null),
                    RowContactPoint(
                        contactsPoint: state.poiDetailDTO.puntiContatto)
                  ],
                ),
              );
            } else if (state is ErrorPoiDetailState) {
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
            } else {
              return const ShimmerDetailComponent();
            }
          },
        ),
      ),
    );
  }

  Widget _buildOpenDataLogo(PoiDetailDTO poiDetailDTO) {
    if (poiDetailDTO.openDataLogo != null) {
      return Image.network(
        '${poiDetailDTO.openDataLogo!.baseUrl}${poiDetailDTO.openDataLogo!.i320}',
        width: 200,
      );
    } else {
      return Container();
    }
  }

  Widget _buildDescription(PoiDetailDTO poiDetailDTO) {
    if (poiDetailDTO.description != null) {
      return Html(data: poiDetailDTO.description);
    } else {
      return Container();
    }
  }

  Widget _buildImages(PoiDetailDTO poiDetailDTO) {
    if (poiDetailDTO.images != null) {
      if (poiDetailDTO.images!.length > 1) {
        return CarouselSlider(
          options: CarouselOptions(viewportFraction: 1),
          items: poiDetailDTO.images!
              .map((item) => Container(
                    child: Center(
                        child: Image.network('${item.baseUrl}${item.i640!}',
                            fit: BoxFit.contain, height: 440, width: 1000)),
                  ))
              .toList(),
        );
      } else {
        if (poiDetailDTO.image != null) {
          return Container(
            child: Center(
                child: Image.network(
                    '${poiDetailDTO.image!.baseUrl}${poiDetailDTO.image!.i640}',
                    fit: BoxFit.contain,
                    height: 400,
                    width: 1000)),
          );
        } else {
          return Container();
        }
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
