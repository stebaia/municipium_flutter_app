import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipium/bloc/bloc/ecostop_bloc/ecostop_bloc.dart';
import 'package:municipium/bloc/cubit/maplist_button_cubit.dart';
import 'package:municipium/model/ecoattivi/ecostop.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/custom_marker.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EcostopSection extends StatelessWidget implements AutoRouteWrapper {
  final String token;

  const EcostopSection({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    GoogleMapController? _controller;
    return BlocProvider(
      create: (context) => MaplistButtonCubit(),
      child:
          BlocBuilder<MaplistButtonCubit, bool>(builder: (context, cubitState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Ecomappa'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.maybePop(),
            ),
          ),
          body: BlocBuilder<EcostopBloc, EcostopState>(
            builder: (context, state) {
              if (state is FetchedEcostopState) {
                return Stack(
                  children: [
                    cubitState
                        ? Container()
                        : _buildMainListView(state.ecostopList),
                    cubitState
                        ? _buildMap(
                            context,
                            (controller) => _controller = controller,
                            state.ecostopList)
                        : Container()
                  ],
                );
              } else if (state is FetchingEcostopState) {
                return ShimmerUtils.buildShimmer(6);
              } else {
                return Text('No ecostops');
              }
            },
          ),
          floatingActionButton: _buildFloatingActionButton(context, cubitState),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      }),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<EcostopBloc>(
          create: (context) => EcostopBloc(ecoattiviRepository: context.read())
            ..fetchEcostopList(
                Provider.of<BaseUrlNotifier>(context, listen: false)
                    .baseUrlEcoattivi,
                token,
                Provider.of<BaseUrlNotifier>(context, listen: false)
                    .guidEcoattivi),
        )
      ], child: this);

  Widget _buildMap(BuildContext context,
      void Function(GoogleMapController)? onMapCreated, List<Ecostop> list) {
    Set<Marker> markers = _initializeMarkers(list, context);
    return GoogleMap(
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: markers.first.position, // Inizia dal primo punto
        zoom: 14.0,
      ),
      markers: markers, // Passa il set di marker alla mappa
      onMapCreated: onMapCreated,
    );
  }

  Set<Marker> _initializeMarkers(List<Ecostop> list, BuildContext context) {
    Set<Marker> markers = {};
    for (var element in list) {
      final int colorValue = int.parse(element.tipoColore ?? '', radix: 16);
      Color color = Color(colorValue | 0xFF000000);
      final marker = Marker(
        markerId: MarkerId(element.indirizzo ?? ''),
        position: LatLng(element.lat ?? -1, element.lon ?? -1),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            HSVColor.fromColor(color).hue),
        onTap: () => context.pushRoute(EcostopDetailRoute(
            ecostop: element)), // Cambia l'icona se desiderato
      );
      markers.add(marker);
    }
    return markers;
  }

  Widget _buildMainListView(List<Ecostop> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () =>
            context.pushRoute(EcostopDetailRoute(ecostop: list[index])),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  CustomMarker(
                      markerColor: MunicipiumUtility.hexToColor(
                          list[index].tipoColore ?? '')),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(list[index].titolo ?? ''),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(list[index].indirizzo ?? '.')
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(Icons.keyboard_arrow_right_sharp),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context, bool cubitState) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Pulsante "Mappa"
          GestureDetector(
            onTap: () {
              context.read<MaplistButtonCubit>().mapSelected(true);
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color:
                    cubitState ? Colors.grey[300] : Colors.white, // Sfondo blu
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.map,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Mappa',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<MaplistButtonCubit>().mapSelected(false);
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: cubitState
                    ? Colors.white
                    : Colors.grey[300], // Sfondo grigio chiaro
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Lista',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
