import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/menu_cubit/menu_toggle_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/ui/components/menu/menu_row.dart';
import 'package:municipium/utils/enum.dart';
import 'package:municipium/utils/utility_helper.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer({super.key, required this.mContext, required this.scaffoldKey});
  BuildContext mContext;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final municipality = (widget.mContext.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    final List<MenuItem> menuList = UtilityHelper.getIterableMenu(municipality);

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
                      onTap: () =>
                          widget.scaffoldKey.currentState?.closeDrawer())
                ],
              ),
              MenuRow(
                  textToShow: municipality.municipalityName,
                  onTapMethod: () {},
                  sizeFont: 20,
                  icon: Icons.person_outlined),
              MenuRow(
                  textToShow: 'Cambia comune',
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
                        textToShow: UtilityHelper.getMenuName(menuList[index]),
                        onTapMethod: () {},
                        sizeFont: 20,
                        icon: UtilityHelper.getMenuIcon(menuList[index]));
                  },
                  itemCount: menuList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics()),
              const Divider(
                color: Colors.white,
              ),
              MenuRow(
                  textToShow: 'Impostazioni', onTapMethod: () {}, sizeFont: 15),
              MenuRow(
                  textToShow: 'Privacy policy',
                  onTapMethod: () {},
                  sizeFont: 15),
              MenuRow(
                  textToShow: 'Info su Municipium',
                  onTapMethod: () {},
                  sizeFont: 15),
              MenuRow(
                  textToShow: 'Invita un amico',
                  onTapMethod: () {},
                  sizeFont: 15),
              MenuRow(textToShow: 'Guida', onTapMethod: () {}, sizeFont: 15)
            ],
          ),
        ),
      ),
    );
  }
}
