import 'package:flutter/material.dart';
import 'package:municipium/di/dependency_injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/routers/app_router.dart';
import 'package:municipium/ui/components/theme_selector.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:municipium/utils/theme_style.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("c1cd13b0-124b-441e-bc9f-309961066d16");
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      // need this for IOS app deleting, securestorage is not deleted with app
      SecureStorage storage = SecureStorage();

      storage.deleteAll();

      prefs.setBool('first_run', false);
    }
    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  }

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: ThemeSelector(builder: (context, mode) {
        return MaterialApp.router(
          onGenerateTitle: (context) => 'Municipium flutter',
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routeInformationParser: _router.defaultRouteParser(),
          routerDelegate: _router.delegate(),
          theme: LightTheme.make,
          darkTheme: DarkTheme.make,
          themeMode: mode,
        );
      }),
    );
  }
}
