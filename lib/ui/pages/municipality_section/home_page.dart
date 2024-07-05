import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/user_menu_conf_cubit_cubit.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/ui/components/menu/menu_drawer.dart';
import 'package:municipium/ui/components/municipality_components/box_dashboard_components.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.scaffoldKey});
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            municipality.municipalityName.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu),
          )),
      body: BlocConsumer<UserMenuConfigurationCubit,List<UserConfigurationMenu>>(
        listener: (context, state) {
        
        },
        builder: (context, state) {
          
            List<UserConfigurationMenu> configurationMenus = state;
            return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxVerticalDashboardComponents(
                      name: configurationMenus[0].serviceName,                      
                    ),
                    
                    BoxVerticalDashboardComponents(
                      name: configurationMenus[1].serviceName,
                      isRemoved: configurationMenus[1].isRemoved,
                    )
                  ],
                ),
                BoxHorizzontalDashboardComponents(name: configurationMenus[2].serviceName,isRemoved: configurationMenus[2].isRemoved, ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxVerticalDashboardComponents(
                      name: configurationMenus[3].serviceName,
                      isRemoved: configurationMenus[3].isRemoved,
                    ),
                    BoxVerticalDashboardComponents(
                      name: configurationMenus[4].serviceName,
                      isRemoved: configurationMenus[4].isRemoved,
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
