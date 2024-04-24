import 'package:municipium/model/menu/submenu_type.dart';
import 'package:municipium/utils/enum.dart';

class MenuItem {
  MenuItemType type;
  SubMenuType? subMenu;

  MenuItem({required this.type, this.subMenu});
}
