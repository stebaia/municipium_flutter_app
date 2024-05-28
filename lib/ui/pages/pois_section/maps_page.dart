import 'dart:async';
import 'package:clippy_flutter/triangle.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipium/app.dart';
import 'package:municipium/bloc/category_poi_bloc/category_poi_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/selected_categories_cubit.dart/selected_categories_cubit.dart';
import 'package:municipium/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:municipium/ui/components/custom_bottomsheet.dart';
import 'package:municipium/ui/components/maps_component/filter_modal_bottomsheet.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:municipium/ui/components/point_of_interests/custom_info_window.dart';

@RoutePage()
class MapsPage extends StatefulWidget implements AutoRouteWrapper {
  const MapsPage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<MapsPage> createState() => _MapsPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PointOfInterestBloc>(
          create: (context) =>
              PointOfInterestBloc(pointOfInterestRepository: context.read())
                ..fetchPointOfInterestList(),
        ),
        BlocProvider<CategoryPoiBloc>(
          create: (context) =>
              CategoryPoiBloc(pointOfInterestRepository: context.read())
                ..fetchCategoryPoiList(),
        ),
        BlocProvider<CategorySelectionCubit>(
          create: (_) => CategorySelectionCubit(),
        )
      ], child: this);
}

class _MapsPageState extends State<MapsPage> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final double offset = 50;
  final double height = 210;
  final double width = 200;

  double _convertColorToHue(ItemCategory? category) {
    Color color;
    if (category != null) {
      if (category.color != null) {
        color = Color(
            int.parse(category.color!.substring(1, 7), radix: 16) + 0xFF000000);
      } else {
        color = Colors.red;
      }
    } else {
      color = Colors.red;
    }

    HSLColor hsl = HSLColor.fromColor(color);
    return hsl.hue;
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final municipality = (context.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return BlocConsumer<PointOfInterestBloc, PointOfInterestState>(
        listener: (context, state) {
      if (state is FetchingPointOfInterestListState) {
        SVProgressHUD.show(
          status: AppLocalizations.of(context)!.loading_sv_message_poi,
        );
      } else {
        SVProgressHUD.dismiss();
      }
    }, builder: (context, state) {
      Set<Marker> markers = {};
      if (state is FetchedPointOfInterestListState) {
        if (state.pointOfInterestsList.pointOfInterestsItemList != null) {
          markers = state.pointOfInterestsList.pointOfInterestsItemList!
              .map((point) => Marker(
                  icon: point.pointOfInterestCategories!.isNotEmpty
                      ? BitmapDescriptor.defaultMarkerWithHue(
                          _convertColorToHue(
                              point.pointOfInterestCategories?.first))
                      : BitmapDescriptor.defaultMarker,
                  markerId: MarkerId(point.id.toString()),
                  position: LatLng(double.parse(point.latitude!),
                      double.parse(point.longitude!)),
                  onTap: () {
                    _customInfoWindowController.addInfoWindow!(
                        Column(
                          children: [
                            Container(
                              color: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.all(16),
                              width: width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    child: Text(
                                      point.name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(point.address!),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  FullWidthConfirmButton(
                                    isEnabled: true,
                                    onTap: () => context.pushRoute(
                                        DetailPoiRoute(poiId: point.id!)),
                                    height: 40,
                                    text: AppLocalizations.of(context)!
                                        .btn_go_open_detail,
                                  )
                                ],
                              ),
                            ),
                            Triangle.isosceles(
                              edge: Edge.BOTTOM,
                              child: Container(
                                color: Theme.of(context).primaryColor,
                                width: 20.0,
                                height: 20.0,
                              ),
                            ),
                          ],
                        ),
                        LatLng(double.parse(point.latitude!),
                            double.parse(point.longitude!)),
                        offset,
                        230,
                        height);
                  }))
              .toSet();
        }
      }
      return Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: false,
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              markers: markers,
              initialCameraPosition: CameraPosition(
                  zoom: 14, target: LatLng(municipality.lat, municipality.lng)),
              onMapCreated: (GoogleMapController controller) {
                _customInfoWindowController.googleMapController = controller;

                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: ((modalContext) => CustomBaseBottomSheet(
                            height: MediaQuery.of(context).size.height * 0.9,
                            title: 'filtri',
                            body: FilterModalBottomSheet(
                              categorySelectionCubit: context.read(),
                              pointOfInterestListBloc: context.read(),
                            )))),
                    child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blueGrey)),
                        child: const Center(
                            child: FaIcon(
                          FontAwesomeIcons.sliders,
                          size: 18,
                        ))),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueGrey)),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 16),
                          hintText: 'Cerca',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              top: 8, bottom: 0, left: 10, right: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blueGrey)),
                        child: const Center(child: Icon(Icons.menu))),
                  ),
                ],
              ),
            ),
          ),
          CustomInfoWindow(
            (top, left, width, height) => null,
            controller: _customInfoWindowController,
          ),
        ],
      );
    });
  }
}
