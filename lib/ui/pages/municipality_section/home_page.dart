import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/user_menu_conf_cubit_cubit.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/municipality_components/box_air_quality_component.dart';
import 'package:municipium/ui/components/municipality_components/box_dashboard_components.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.scaffoldKey});
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final municipality = context.read<MunicipalityStoredCubit>().state!;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () =>
                    context.pushRoute(const UserConfMenuEditRoute()),
                icon: Icon(Icons.edit))
          ],
          title: Text(
            '${municipality.municipalityName.toUpperCase()} (${municipality.province.toUpperCase()})',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu),
          )),
      body:
          BlocConsumer<UserMenuConfigurationCubit, List<UserConfigurationMenu>>(
        listener: (context, state) {},
        builder: (context, state) {
          List<UserConfigurationMenu> configurationMenus = state;
          if (configurationMenus.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxVerticalInfoDashboardComponents(
                      municipality: municipality,
                    ),
                    BoxVerticalDashboardComponents(
                      assetImage: configurationMenus[0].assetImage,
                      name: configurationMenus[0].serviceName,
                      isRemoved: configurationMenus[0].isRemoved,
                      slug: configurationMenus[0].slug,
                    ),
                  ],
                ),
                BoxHorizzontalDashboardComponents(
                  assetImage: configurationMenus[1].assetImage,
                  name: configurationMenus[1].serviceName,
                  isRemoved: configurationMenus[1].isRemoved,
                  slug: configurationMenus[0].slug,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxVerticalDashboardComponents(
                      assetImage: configurationMenus[2].assetImage,
                      name: configurationMenus[2].serviceName,
                      isRemoved: configurationMenus[2].isRemoved,
                      slug: configurationMenus[0].slug,
                    ),
                    BoxVerticalDashboardComponents(
                      assetImage: configurationMenus[3].assetImage,
                      name: configurationMenus[3].serviceName,
                      isRemoved: configurationMenus[3].isRemoved,
                      slug: configurationMenus[0].slug,
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
