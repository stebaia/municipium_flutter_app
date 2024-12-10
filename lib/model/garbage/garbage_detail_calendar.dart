class GarbageDetailCalendar {
  String? title;
  Category? category;
  String? start;
  String? end;
  bool? allDay;
  String? color;
  String? imageWhite;
  String? imageGreen;

  GarbageDetailCalendar(
      {this.title,
      this.category,
      this.start,
      this.end,
      this.allDay,
      this.color,
      this.imageWhite,
      this.imageGreen});

  GarbageDetailCalendar.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    start = json['start'];
    end = json['end'];
    allDay = json['allDay'];
    color = json['color'];
    imageWhite = json['image_white'];
    imageGreen = json['image_green'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['start'] = this.start;
    data['end'] = this.end;
    data['allDay'] = this.allDay;
    data['color'] = this.color;
    data['image_white'] = this.imageWhite;
    data['image_green'] = this.imageGreen;
    return data;
  }
}

class Category {
  String? name;
  int? id;

  Category({this.name, this.id});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}