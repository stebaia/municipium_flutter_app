import 'package:municipium/model/menu/submenu_type.dart';

class DmsDTO extends SubMenuType {
  String? eatery;
  String? host;
  String? poi;
  String? experience;

  DmsDTO({this.eatery, this.host, this.poi, this.experience});

  DmsDTO.fromJson(Map<String, dynamic> json) {
    eatery = json['eatery'];
    host = json['host'];
    poi = json['poi'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eatery'] = this.eatery;
    data['host'] = this.host;
    data['poi'] = this.poi;
    data['experience'] = this.experience;
    return data;
  }
}
