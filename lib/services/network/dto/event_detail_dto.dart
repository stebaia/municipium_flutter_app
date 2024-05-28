import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/services/network/dto/contact_point_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:pine/dto/dto.dart';

class EventDetailDto extends DTO implements Equatable {
  int? id;
  String? title;
  String? content;
  String? url;
  int? municipalityId;
  List<PuntiContatto>? puntiContatto;
  String? municipalityName;
  String? slug;
  String? excerpt;
  String? publishedAt;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? address;
  double? latitude;
  double? longitude;
  bool? featured;
  String? updatedAt;
  String? createdAt;
  bool? fullscreen;
  String? livello1;
  String? livello2;
  String? tipo;
  String? breve;
  String? subtitle;
  String? rivoltoA;
  int? parentId;
  String? costo;
  String? patrocinatoDa;
  String? sponsorPnrr;
  String? ulterioriInformazioni;
  MImagesDTO? image;
  List<MImagesDTO>? images;
  String? startTimeWithTimezone;
  String? endTimeWithTimezone;
  List<EventCategories>? eventCategories;
  bool? isImported;
  List<Attachments>? attachments;
  String? translation;
  List<Argomento>? argomenti;
  List<Persona>? persone;
  Parent? parent;
  List<Childs>? childs;
  List<SupportatoDa>? supportatoDa;
  Luogo? luogo;

  EventDetailDto(
      {this.id,
      this.title,
      this.content,
      this.url,
      this.municipalityId,
      this.puntiContatto,
      this.municipalityName,
      this.slug,
      this.excerpt,
      this.publishedAt,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.address,
      this.latitude,
      this.longitude,
      this.featured,
      this.updatedAt,
      this.createdAt,
      this.fullscreen,
      this.livello1,
      this.livello2,
      this.tipo,
      this.breve,
      this.subtitle,
      this.rivoltoA,
      this.parentId,
      this.costo,
      this.patrocinatoDa,
      this.sponsorPnrr,
      this.ulterioriInformazioni,
      this.image,
      this.images,
      this.startTimeWithTimezone,
      this.endTimeWithTimezone,
      this.eventCategories,
      this.isImported,
      this.attachments,
      this.translation,
      this.argomenti,
      this.persone,
      this.parent,
      this.childs,
      supportatoDa});

  EventDetailDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    url = json['url'];
    municipalityId = json['municipality_id'];
    if (json['punti_contatto'] != null) {
      puntiContatto = <PuntiContatto>[];
      json['punti_contatto'].forEach((v) {
        puntiContatto!.add(new PuntiContatto.fromJson(v));
      });
    }
    municipalityName = json['municipality_name'];
    slug = json['slug'];
    excerpt = json['excerpt'];
    publishedAt = json['published_at'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    featured = json['featured'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    fullscreen = json['fullscreen'];
    livello1 = json['livello1'];
    livello2 = json['livello2'];
    tipo = json['tipo'];
    breve = json['breve'];
    subtitle = json['subtitle'];
    rivoltoA = json['rivolto_a'];
    parentId = json['parent_id'];
    costo = json['costo'];
    patrocinatoDa = json['patrocinato_da'];
    sponsorPnrr = json['sponsor_pnrr'];
    ulterioriInformazioni = json['ulteriori_informazioni'];
    image =
        json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <MImagesDTO>[];
      json['images'].forEach((v) {
        images!.add(new MImagesDTO.fromJson(v));
      });
    }
    startTimeWithTimezone = json['start_time_with_timezone'];
    endTimeWithTimezone = json['end_time_with_timezone'];
    if (json['event_categories'] != null) {
      eventCategories = <EventCategories>[];
      json['event_categories'].forEach((v) {
        eventCategories!.add(new EventCategories.fromJson(v));
      });
    }
    isImported = json['is_imported'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    translation = json['translation'];
    if (json['argomenti'] != null) {
      argomenti = <Argomento>[];
      json['argomenti'].forEach((v) {
        argomenti!.add(new Argomento.fromJson(v));
      });
    }
    if (json['persone'] != null) {
      persone = <Persona>[];
      json['persone'].forEach((v) {
        persone!.add(new Persona.fromJson(v));
      });
    }
    if (json['supportato_da'] != null) {
      supportatoDa = <SupportatoDa>[];
      json['supportato_da'].forEach((v) {
        supportatoDa!.add(new SupportatoDa.fromJson(v));
      });
    }
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    if (json['childs'] != null) {
      childs = <Childs>[];
      json['childs'].forEach((v) {
        childs!.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['url'] = this.url;
    data['municipality_id'] = this.municipalityId;
    if (this.puntiContatto != null) {
      data['punti_contatto'] =
          this.puntiContatto!.map((v) => v.toJson()).toList();
    }
    data['municipality_name'] = this.municipalityName;
    data['slug'] = this.slug;
    data['excerpt'] = this.excerpt;
    data['published_at'] = this.publishedAt;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['featured'] = this.featured;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['fullscreen'] = this.fullscreen;
    data['livello1'] = this.livello1;
    data['livello2'] = this.livello2;
    data['tipo'] = this.tipo;
    data['breve'] = this.breve;
    data['subtitle'] = this.subtitle;
    data['rivolto_a'] = this.rivoltoA;
    data['parent_id'] = this.parentId;
    data['costo'] = this.costo;
    data['patrocinato_da'] = this.patrocinatoDa;
    data['sponsor_pnrr'] = this.sponsorPnrr;
    data['ulteriori_informazioni'] = this.ulterioriInformazioni;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['start_time_with_timezone'] = this.startTimeWithTimezone;
    data['end_time_with_timezone'] = this.endTimeWithTimezone;
    if (this.eventCategories != null) {
      data['event_categories'] =
          this.eventCategories!.map((v) => v.toJson()).toList();
    }
    data['is_imported'] = this.isImported;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    data['translation'] = this.translation;
    if (this.argomenti != null) {
      data['argomenti'] = this.argomenti!.map((v) => v.toJson()).toList();
    }
    if (this.persone != null) {
      data['persone'] = this.persone!.map((v) => v.toJson()).toList();
    }
    if (this.supportatoDa != null) {
      data['supportato_da'] =
          this.supportatoDa!.map((v) => v.toJson()).toList();
    }
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    if (this.childs != null) {
      data['childs'] = this.childs!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class EventCategories {
  String? name;
  int? id;
  Null? color;

  EventCategories({this.name, this.id, this.color});

  EventCategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}

class Luogo {
  String? address;
  int? id;
  String? breve;
  String? name;
  int? latitude;
  int? longitude;

  Luogo(
      {this.address,
      this.id,
      this.breve,
      this.name,
      this.latitude,
      this.longitude});

  Luogo.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    id = json['id'];
    breve = json['breve'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['breve'] = this.breve;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Attachments {
  String? cloud;
  String? createdAt;
  String? extension;
  String? file;
  int? size;
  String? contentType;
  String? name;
  String? updatedAt;

  Attachments(
      {this.cloud,
      this.createdAt,
      this.extension,
      this.file,
      this.size,
      this.contentType,
      this.name,
      this.updatedAt});

  Attachments.fromJson(Map<String, dynamic> json) {
    cloud = json['cloud'];
    createdAt = json['createdAt'];
    extension = json['extension'];
    file = json['file'];
    size = json['size'];
    contentType = json['content_type'];
    name = json['name'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cloud'] = this.cloud;
    data['createdAt'] = this.createdAt;
    data['extension'] = this.extension;
    data['file'] = this.file;
    data['size'] = this.size;
    data['content_type'] = this.contentType;
    data['name'] = this.name;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class SupportatoDa {
  String? titolo;
  int? id;

  SupportatoDa({this.titolo, this.id});

  SupportatoDa.fromJson(Map<String, dynamic> json) {
    titolo = json['titolo'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titolo'] = this.titolo;
    data['id'] = this.id;
    return data;
  }
}

class Persona {
  String? name;
  int? id;

  Persona({this.name, this.id});

  Persona.fromJson(Map<String, dynamic> json) {
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

class Argomento {
  String? name;
  int? id;

  Argomento({this.name, this.id});

  Argomento.fromJson(Map<String, dynamic> json) {
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

class Parent {
  int? parentId;
  String? parentTitle;

  Parent({this.parentId, this.parentTitle});

  Parent.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    parentTitle = json['parent_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_id'] = this.parentId;
    data['parent_title'] = this.parentTitle;
    return data;
  }
}

class Childs {
  String? child_title;
  int? child_int;

  Childs({this.child_title, this.child_int});

  Childs.fromJson(Map<String, dynamic> json) {
    child_title = json['child_title'];
    child_int = json['child_int'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_title'] = this.child_title;
    data['child_int'] = this.child_int;
    return data;
  }
}
