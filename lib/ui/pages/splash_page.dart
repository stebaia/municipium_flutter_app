import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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
    final status = await OneSignal.shared.getDeviceState();
    if (status != null) {
      secureStorage
          .setOneSignalKeyInStorage(status.userId!)
          .then((value) => context.pushRoute(const MainRoute()));
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
