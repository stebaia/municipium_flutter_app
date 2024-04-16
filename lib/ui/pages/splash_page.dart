import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
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
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return BlocListener<MunicipalityBloc, MunicipalityState>(
      listener: (context, state) {
        final status = OneSignal.User.pushSubscription.id;
        final secureStorage = SecureStorage();
    if (status != null) {
      secureStorage.setOneSignalKeyInStorage(status);
    }
        if(state is FetchedMunicipalityState) {
          context.pushRoute(WelcomeRoute(municipalityId: state.municipality.muninicipalityId));
        }else {
          context.pushRoute(OnboardingRoute());
        }
      },
      child: const Scaffold(
        backgroundColor: Color(ThemeHelper.blueMunicipium),
        body: Center(
          child: Icon(Icons.ac_unit),
        ),
      ),
    );
  }

  Future<void> _replacePage(
      BuildContext context, PageRouteInfo routeInfo) async {
    //context.router.popUntilRoot();
    await context.router.push(routeInfo);
  }
}
