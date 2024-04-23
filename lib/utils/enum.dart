import 'package:municipium/model/menu/submenu_type.dart';

enum MenuItemType {
  news,
  issue,
  penalties,
  surveys,
  garbage,
  ecoattivi,
  poi,
  services,
  dms,
  digitalDossier,
  civilDefence,
  payment
}

class MenuItem {
  MenuItemType type;
  SubMenuType? subMenu;

  MenuItem({required this.type, this.subMenu});
}
