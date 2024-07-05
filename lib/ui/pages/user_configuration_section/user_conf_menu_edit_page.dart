import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/temporary_menu_conf_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/user_menu_conf_cubit_cubit.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/ui/components/municipality_components/box_dashboard_commponent_editable.dart';
import 'package:municipium/ui/components/municipality_components/box_dashboard_components.dart';
import 'package:municipium/utils/mock_file.dart';
import 'package:path/path.dart';

@RoutePage()
class UserConfMenuEditPage extends StatelessWidget {
  const UserConfMenuEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return PopScope(
      onPopInvoked: (did) {
        context.read<TemporaryConfigurationCubit>().reset(context.read<UserMenuConfigurationCubit>().state);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'modifica widget'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: BlocConsumer<TemporaryConfigurationCubit,
            List<UserConfigurationMenu>>(
          listener: (context, state) {},
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
                      BoxVerticalEditableDashboardComponents(
                        name: configurationMenus[0].serviceName,
                        isMandatory: true,
                        isRemoved: configurationMenus[0].isRemoved,
                        onRemove: () =>
                            onTapRemoveBox(0,context),
                        onEdit: () => onTapEditBox(0, context),
                      ),
                      BoxVerticalEditableDashboardComponents(
                        name: configurationMenus[1].serviceName,
                        isRemoved: configurationMenus[1].isRemoved,
                        onRemove: () =>
                            onTapRemoveBox(1,context),
                        onEdit: () => onTapEditBox(1, context),
                      )
                    ],
                  ),
                  BoxHorizzontalEditableDashboardComponents(
                    name: configurationMenus[2].serviceName,
                    isRemoved: configurationMenus[2].isRemoved,
                        onRemove: () =>
                            onTapRemoveBox(2,context),
                        onEdit: () => onTapEditBox(2, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxVerticalEditableDashboardComponents(
                        name: configurationMenus[3].serviceName,
                        isRemoved: configurationMenus[3].isRemoved,
                        onRemove: () =>
                            onTapRemoveBox(3,context),
                        onEdit: () => onTapEditBox(3, context),
                      ),
                      BoxVerticalEditableDashboardComponents(
                        name: configurationMenus[4].serviceName,
                        isRemoved: configurationMenus[4].isRemoved,
                        onRemove: () =>
                            onTapRemoveBox(4,context),
                        onEdit: () => onTapEditBox(4, context),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<TemporaryConfigurationCubit>().reset(
                                  context
                                      .read<UserMenuConfigurationCubit>()
                                      .state);
                              context.maybePop();
                            },
                            child: Text('Annulla')),
                        ElevatedButton(
                            onPressed: () {
                              final tempConfigurations = context
                                  .read<TemporaryConfigurationCubit>()
                                  .state;
                              context
                                  .read<UserMenuConfigurationCubit>()
                                  .emit(List.from(tempConfigurations));
                              context.maybePop();
                            },
                            child: Text('Salva')),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void onTapRemoveBox(
    int index,
    BuildContext context,
  ) {
    UserConfigurationMenu emptyConf = UserConfigurationMenu(serviceName: '',isMandatory: false,isRemoved: true, position: 0);
    context
        .read<TemporaryConfigurationCubit>()
        .updateConfiguration(emptyConf, index);
  }
  void onTapEditBox(int position, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(itemCount: mockServiceName.length, itemBuilder:(context, index) => InkWell(
          child: Container(height: 60,child: Center(child: Text(mockServiceName[index]))),
          onTap: ()  {
             context.read<TemporaryConfigurationCubit>().updateConfiguration(UserConfigurationMenu(serviceName: mockServiceName[index], isMandatory: false, position: position), position);
              Navigator.pop(context);
          }
         
        ))
         
      ),
    );
  }
}
