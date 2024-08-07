class OnlineService {
  int? id;
  String? name;
  String? link;

  OnlineService({this.id, this.name, this.link,});

  OnlineService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    return data;
  }
}