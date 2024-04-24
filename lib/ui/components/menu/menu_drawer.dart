import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/model/menu/menu_item.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/menu/menu_row.dart';
import 'package:municipium/utils/enum.dart';
import 'package:municipium/utils/menu_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({super.key, required this.mContext, required this.scaffoldKey});
  BuildContext mContext;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final municipality = (mContext.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    List<MenuItem> menuList = MenuHelper.getIterableMenu(municipality);

    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  GestureDetector(
                      child: const Icon(Icons.close),
                      onTap: () => scaffoldKey.currentState?.closeDrawer())
                ],
              ),
              if (municipality.new_menu.digitalDossier != null) ...[
                MenuRow(
                    textToShow: AppLocalizations.of(context)!.spid_login_menu,
                    onTapMethod: () {},
                    sizeFont: 20,
                    icon: Icons.person_outlined),
              ],
              MenuRow(
                  textToShow:
                      AppLocalizations.of(context)!.municipality_change_menu,
                  onTapMethod: () {},
                  sizeFont: 20,
                  icon: Icons.location_on_outlined),
              const Divider(
                color: Colors.white,
              ),
              ListView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  itemBuilder: (context, index) {
                    return MenuRow(
                        textToShow:
                            MenuHelper.getMenuName(context, menuList[index]),
                        onTapMethod: () {
                          if (menuList[index].subMenu != null) {
                            context.pushRoute(SubMenuRoute(
                                menu: menuList[index].subMenu!,
                                item: menuList[index]));
                          } else {
                            MenuHelper.checkAndPushRoute(
                                context, menuList[index]);
                          }
                        },
                        sizeFont: 20,
                        icon: MenuHelper.getMenuIcon(menuList[index]));
                  },
                  itemCount: menuList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics()),
              const Divider(
                color: Colors.white,
              ),
              MenuRow(
                  textToShow: AppLocalizations.of(context)!.settings_menu,
                  onTapMethod: () {},
                  sizeFont: 15),
              MenuRow(
                  textToShow: AppLocalizations.of(context)!.privacy_policy_menu,
                  onTapMethod: () {},
                  sizeFont: 15),
              MenuRow(
                  textToShow: AppLocalizations.of(context)!.info_munic_menu,
                  onTapMethod: () {},
                  sizeFont: 15),
              MenuRow(
                  textToShow: AppLocalizations.of(context)!.invite_friend_menu,
                  onTapMethod: () {},
                  sizeFont: 15),
              MenuRow(
                  textToShow: AppLocalizations.of(context)!.guide_menu,
                  onTapMethod: () {},
                  sizeFont: 15)
            ],
          ),
        ),
      ),
    );
  }
}
