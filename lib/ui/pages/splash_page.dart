import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
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
    return BlocListener<MunicipalityGlobalCubit, MunicipalityGlobalState>(
      listener: (context, state) {
        final status = OneSignal.User.pushSubscription.id;
        final secureStorage = SecureStorage();
        if (status != null) {
          secureStorage.setOneSignalKeyInStorage(status);
        }
        if (state is FetchedMunicipalityGlobalState) {
          context.pushRoute(WelcomeRoute(
              municipalityId: state.municipality.muninicipalityId));
        } else if (state is StoredMunicipalityGlobalState) {
        } else {
          context.pushRoute(OnboardingRoute());
        }
      },
      child: const Scaffold(
        backgroundColor: ThemeHelper.blueMunicipium,
        body: Column(
          children: [
            LinearProgressIndicator(),
            Text('Bentornato su Municipium!', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),)
          ],
        )
      ),
    );
  }

  Future<void> _replacePage(
      BuildContext context, PageRouteInfo routeInfo) async {
    //context.router.popUntilRoot();
    await context.router.push(routeInfo);
  }
}
