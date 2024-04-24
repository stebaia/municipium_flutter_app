import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:municipium/model/menu/menu_item.dart';
import 'package:municipium/model/menu/submenu_type.dart';
import 'package:municipium/services/network/dto/civil_defence_dto.dart';
import 'package:municipium/services/network/dto/dms_dto.dart';
import 'package:municipium/services/network/dto/garbage_dto.dart';
import 'package:municipium/ui/components/menu/menu_row.dart';
import 'package:municipium/utils/enum.dart';
import 'package:municipium/utils/menu_helper.dart';

@RoutePage()
class SubMenuPage extends StatelessWidget {
  SubMenuPage({super.key, required this.menu, required this.item});
  SubMenuType menu;
  MenuItem item;

  @override
  Widget build(BuildContext context) {
    List<SubMenuItemType> list = MenuHelper.getIterableSubmenu(menu);
    return Scaffold(
      appBar: AppBar(
        title: Text(MenuHelper.getMenuName(context, item),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return MenuRow(
                  textToShow:
                      MenuHelper.getSubMenuName(context, list[index]) ?? '',
                  onTapMethod: () {},
                  sizeFont: 20,
                  icon: MenuHelper.getSubMenuIcon(list[index]),
                  showIconArrow: true,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
