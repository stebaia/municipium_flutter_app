class CivilDefenceListInformations {
  int? id;
  String? content;
  List<Attachments>? attachments;

  CivilDefenceListInformations({this.id, this.content, this.attachments});

  CivilDefenceListInformations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  String? name;
  String? file;
  String? contentType;
  String? extension;
  int? size;
  String? site;

  Attachments(
      {this.name,
      this.file,
      this.contentType,
      this.extension,
      this.size,
      this.site});

  Attachments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    file = json['file'];
    contentType = json['content_type'];
    extension = json['extension'];
    size = json['size'];
    site = json['site'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['file'] = this.file;
    data['content_type'] = this.contentType;
    data['extension'] = this.extension;
    data['size'] = this.size;
    data['site'] = this.site;
    return data;
  }
}