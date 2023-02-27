import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:municipium/di/dependency_injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/routers/app_router.gr.dart';


class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();
  

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: MaterialApp.router(
        onGenerateTitle: (context) => 'Municipium flutter',
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
      ),
    );
  }
}