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
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/mock_file.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

@RoutePage()
class UserConfMenuEditPage extends StatelessWidget {
  const UserConfMenuEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;

    String baseUrl =
        Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context
            .read<TemporaryConfigurationCubit>()
            .reset(context.read<UserMenuConfigurationCubit>().state);
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
            if (configurationMenus.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        height: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                      BoxVerticalEditableDashboardComponents(
                        name: configurationMenus[0].serviceName,
                        isRemoved: configurationMenus[0].isRemoved,
                        onRemove: () => onTapRemoveBox(0, context),
                        onEdit: () => onTapEditBox(
                            baseUrl: baseUrl,
                            municipalityId:
                                municipality.muninicipalityId.toString(),
                            position: 0,
                            context: context),
                      )
                    ],
                  ),
                  BoxHorizzontalEditableDashboardComponents(
                    name: configurationMenus[1].serviceName,
                    isRemoved: configurationMenus[1].isRemoved,
                    onRemove: () => onTapRemoveBox(1, context),
                    onEdit: () => onTapEditBox(
                        baseUrl: baseUrl,
                        municipalityId:
                            municipality.muninicipalityId.toString(),
                        position: 1,
                        context: context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxVerticalEditableDashboardComponents(
                        name: configurationMenus[2].serviceName,
                        isRemoved: configurationMenus[2].isRemoved,
                        onRemove: () => onTapRemoveBox(3, context),
                        onEdit: () => onTapEditBox(
                            baseUrl: baseUrl,
                            municipalityId:
                                municipality.muninicipalityId.toString(),
                            position: 2,
                            context: context),
                      ),
                      BoxVerticalEditableDashboardComponents(
                        name: configurationMenus[3].serviceName,
                        isRemoved: configurationMenus[3].isRemoved,
                        onRemove: () => onTapRemoveBox(3, context),
                        onEdit: () => onTapEditBox(
                            baseUrl: baseUrl,
                            municipalityId:
                                municipality.muninicipalityId.toString(),
                            position: 3,
                            context: context),
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
    UserConfigurationMenu emptyConf = UserConfigurationMenu(
        assetImage: '',
        serviceName: '',
        slug: '',
        isMandatory: false,
        isRemoved: true,
        position: 0);
    context
        .read<TemporaryConfigurationCubit>()
        .updateConfiguration(emptyConf, index);
  }

  void onTapEditBox(
      {required String baseUrl,
      required String municipalityId,
      required int position,
      required BuildContext context}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (bcontext) => FutureBuilder(
          future: context
              .read<TemporaryConfigurationCubit>()
              .getMunicipalityUser(baseUrl, municipalityId),
          builder: (scontext, snapshot) {
            if (snapshot.hasData) {
              List<UserConfigurationMenu> userConfiguration = snapshot.data!;
              return Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                      itemCount: userConfiguration.length,
                      itemBuilder: (context, index) => InkWell(
                          child: Container(
                              height: 60,
                              child: Center(
                                  child: Text(
                                      userConfiguration[index].serviceName))),
                          onTap: () {
                            context
                                .read<TemporaryConfigurationCubit>()
                                .updateConfiguration(
                                    UserConfigurationMenu(
                                        assetImage:
                                            userConfiguration[index].assetImage,
                                        serviceName: userConfiguration[index]
                                            .serviceName,
                                        isMandatory: userConfiguration[index]
                                            .isMandatory,
                                        position: position,
                                        slug: userConfiguration[index].slug),
                                    position);
                            Navigator.pop(context);
                          })));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
