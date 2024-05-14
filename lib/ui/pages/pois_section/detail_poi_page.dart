import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';


@RoutePage()
class DetailPoiPage extends StatelessWidget implements AutoRouteWrapper {
  const DetailPoiPage({super.key, required this.poiId});

  final int poiId;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  
  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    throw UnimplementedError();
  }
}