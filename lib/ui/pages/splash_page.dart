import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:municipium/utils/shared_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    loadSplash();
    super.initState();
  }

  Future loadSplash() async {
    final secureStorage = SecureStorage();
    StorageSharedPreferences sharedPreferences = StorageSharedPreferences.instance;
    bool isFirstTime  = await sharedPreferences.isFirstTimeFromShared();
    final status = OneSignal.User.pushSubscription.id;
    if(status != null) {
      secureStorage.setOneSignalKeyInStorage(status);
    }
    if(isFirstTime) {
      context.pushRoute(OnboardingRoute());
      //go to onboarding
    }else {
      //get Municipality information
      //store the MunicipalityInfo in local storage
      //go to dashboard
      context.pushRoute(const MainRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(ThemeHelper.blueMunicipium),
      body: Center(
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
