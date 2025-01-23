class CivilDefenceAreYouReady {
  String? image;
  int? id;
  String? title;
  List<Paragraphs>? paragraphs;

  CivilDefenceAreYouReady({this.image, this.id, this.title, this.paragraphs});

  CivilDefenceAreYouReady.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    title = json['title'];
    if (json['paragraphs'] != null) {
      paragraphs = <Paragraphs>[];
      json['paragraphs'].forEach((v) {
        paragraphs!.add(new Paragraphs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.paragraphs != null) {
      data['paragraphs'] = this.paragraphs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paragraphs {
  String? title;
  String? detail;

  Paragraphs({this.title, this.detail});

  Paragraphs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['detail'] = this.detail;
    return data;
  }
}
