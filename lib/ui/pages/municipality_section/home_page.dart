import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';


@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}