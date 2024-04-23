import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:municipium/model/menu/submenu_type.dart';
import 'package:municipium/services/network/dto/civil_defence_dto.dart';
import 'package:municipium/services/network/dto/dms_dto.dart';
import 'package:municipium/services/network/dto/garbage_dto.dart';
import 'package:municipium/ui/components/menu/menu_row.dart';
import 'package:municipium/utils/enum.dart';
import 'package:municipium/utils/menu_helper.dart';

@RoutePage()
class SubMenuPage extends StatelessWidget {
  SubMenuPage({super.key, required this.menu});
  SubMenuType menu;

  @override
  Widget build(BuildContext context) {
    List<SubMenuItemType> list = MenuHelper.getIterableSubmenu(menu);
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return MenuRow(
              textToShow: MenuHelper.getSubMenuName(list[index]) ?? '',
              onTapMethod: () {},
              sizeFont: 20,
              icon: MenuHelper.getSubMenuIcon(list[index]));
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.white),
      ),
    );
  }
}
