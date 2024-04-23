import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/utils/enum.dart';
import 'package:municipium/utils/utility_helper.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer({super.key, required this.mContext});
  BuildContext mContext;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final municipality = (widget.mContext.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              GestureDetector(child: const Icon(Icons.close))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.person_outlined),
                  SizedBox(width: 16),
                  Text(municipality.subdomain,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(width: 20)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 16),
                  Text('Cambia comune',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(width: 20)
                ],
              ),
            ),
          ),
          const Divider(),
          ListView.builder(itemBuilder: (context, index) {
            //return BlocBuilder<MenuToggleCubit, MenuToggleVisibility>(
            //builder: (context, state) {
            //if (state == MenuToggleVisibility.visible) {
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(UtilityHelper.getMenuIcon(menuList[index])),
                    const SizedBox(width: 16),
                    Text(UtilityHelper.getMenuName(menuList[index]),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(width: 20)
                  ],
                ),
              ),
            );
            //} else {
            //return Container();
            //}
            //});
          })
        ],
      ),
    );
  }
}
