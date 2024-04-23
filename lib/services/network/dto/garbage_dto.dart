import 'package:municipium/model/menu/submenu_type.dart';

class GarbageDTO extends SubMenuType {
  String? recyclingAreas;
  String? calendars;
  String? garbageCollections;
  String? garbageCategories;

  GarbageDTO(
      {this.recyclingAreas,
      this.calendars,
      this.garbageCollections,
      this.garbageCategories});

  GarbageDTO.fromJson(Map<String, dynamic> json) {
    recyclingAreas = json['recycling_areas'];
    calendars = json['calendars'];
    garbageCollections = json['garbage_collections'];
    garbageCategories = json['garbage_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recycling_areas'] = this.recyclingAreas;
    data['calendars'] = this.calendars;
    data['garbage_collections'] = this.garbageCollections;
    data['garbage_categories'] = this.garbageCategories;
    return data;
  }
}
