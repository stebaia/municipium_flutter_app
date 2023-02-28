import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:municipium/di/dependency_injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<StatefulWidget> createState() => new _App();
}

class _App extends State<App> {
  final _router = AppRouter();

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId("c1cd13b0-124b-441e-bc9f-309961066d16");
    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: MaterialApp.router(
        onGenerateTitle: (context) => 'Municipium flutter',
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
