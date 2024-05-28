import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/contact_point_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:pine/dto/dto.dart';

class PoiDetailDTO extends DTO with EquatableMixin {
  String? mail;
  String? twitterLink;
  MImagesDTO? openDataLogo;
  String? type;
  String? youtubeLink;
  int? municipalityId;
  List<PuntiContatto>? puntiContatto;
  String? instagramLink;
  int? id;
  List<PointOfInterestCategories>? pointOfInterestCategories;
  String? fax;
  String? breve;
  String? longitude;
  MImagesDTO? image;
  List<MImagesDTO>? images;
  String? openingTimesUrl;
  String? circoscrizione;
  String? entry;
  String? nomeAlternativo;
  bool? fullscreen;
  String? phone;
  String? identificativo;
  String? name;
  String? excerpt;
  String? galleriaVideo;
  String? servizi;
  String? latitude;
  String? facebookLink;
  String? description;
  List<String>? tipiLuogo;
  int? idOpenData;
  String? modalitaAccesso;
  String? openDataIdentifier;
  String? cap;
  String? updatedAt;
  String? ulterioriInformazioni;
  String? galleryId;
  String? address;
  String? tripAdvisorLink;
  bool? isAlwaysOpen;
  List<String>? strutturaResponsabile;
  String? openingTimes;
  String? url;
  List<String>? luoghiCollegati;
  String? municipalityName;
  String? mail2;
  String? quartiere;
  List<Argomenti>? argomenti;
  String? webSite;

  PoiDetailDTO(
      {this.mail,
      this.twitterLink,
      this.openDataLogo,
      this.type,
      this.youtubeLink,
      this.municipalityId,
      this.puntiContatto,
      this.instagramLink,
      this.id,
      this.pointOfInterestCategories,
      this.fax,
      this.breve,
      this.longitude,
      this.image,
      this.images,
      this.openingTimesUrl,
      this.circoscrizione,
      this.entry,
      this.nomeAlternativo,
      this.fullscreen,
      this.phone,
      this.identificativo,
      this.name,
      this.excerpt,
      this.galleriaVideo,
      this.servizi,
      this.latitude,
      this.facebookLink,
      this.description,
      this.tipiLuogo,
      this.idOpenData,
      this.modalitaAccesso,
      this.openDataIdentifier,
      this.cap,
      this.updatedAt,
      this.ulterioriInformazioni,
      this.galleryId,
      this.address,
      this.tripAdvisorLink,
      this.isAlwaysOpen,
      this.strutturaResponsabile,
      this.openingTimes,
      this.url,
      this.luoghiCollegati,
      this.municipalityName,
      this.mail2,
      this.quartiere,
      this.argomenti,
      this.webSite});

  PoiDetailDTO.fromJson(Map<String, dynamic> json) {
    mail = json['mail'];
    twitterLink = json['twitter_link'];
    openDataLogo = json['open_data_logo'] != null
        ? MImagesDTO.fromJson(json['open_data_logo'])
        : null;
    type = json['type'];
    youtubeLink = json['youtube_link'];
    municipalityId = json['municipality_id'];
    if (json['punti_contatto'] != null) {
      puntiContatto = <PuntiContatto>[];
      json['punti_contatto'].forEach((v) {
        puntiContatto!.add(new PuntiContatto.fromJson(v));
      });
    }
    instagramLink = json['instagram_link'];
    id = json['id'];
    if (json['point_of_interest_categories'] != null) {
      pointOfInterestCategories = <PointOfInterestCategories>[];
      json['point_of_interest_categories'].forEach((v) {
        pointOfInterestCategories!
            .add(new PointOfInterestCategories.fromJson(v));
      });
    }
    fax = json['fax'];
    breve = json['breve'];
    longitude = json['longitude'];
    image =
        json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <MImagesDTO>[];
      json['images'].forEach((v) {
        if (v['image'] != null) {
          images!.add(new MImagesDTO.fromJson(v['image']));
        }
      });
    }
    openingTimesUrl = json['opening_times_url'];
    circoscrizione = json['circoscrizione'];
    entry = json['entry'];
    nomeAlternativo = json['nome_alternativo'];
    fullscreen = json['fullscreen'];
    phone = json['phone'];
    identificativo = json['identificativo'];
    name = json['name'];
    excerpt = json['excerpt'];
    galleriaVideo = json['galleria_video'];
    servizi = json['servizi'];
    latitude = json['latitude'];
    facebookLink = json['facebook_link'];
    description = json['description'];

    idOpenData = json['id_open_data'];
    modalitaAccesso = json['modalita_accesso'];
    openDataIdentifier = json['open_data_identifier'];
    cap = json['cap'];
    updatedAt = json['updated_at'];
    ulterioriInformazioni = json['ulteriori_informazioni'];
    galleryId = json['gallery_id'];
    address = json['address'];
    tripAdvisorLink = json['trip_advisor_link'];
    isAlwaysOpen = json['is_always_open'];

    openingTimes = json['opening_times'];
    url = json['url'];

    municipalityName = json['municipality_name'];
    mail2 = json['mail2'];
    quartiere = json['quartiere'];
    if (json['argomenti'] != null) {
      argomenti = <Argomenti>[];
      json['argomenti'].forEach((v) {
        argomenti!.add(new Argomenti.fromJson(v));
      });
    }
    webSite = json['web_site'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mail'] = this.mail;
    data['twitter_link'] = this.twitterLink;
    data['open_data_logo'] = this.openDataLogo;
    data['type'] = this.type;
    data['youtube_link'] = this.youtubeLink;
    data['municipality_id'] = this.municipalityId;
    if (this.puntiContatto != null) {
      data['punti_contatto'] =
          this.puntiContatto!.map((v) => v.toJson()).toList();
    }
    data['instagram_link'] = this.instagramLink;
    data['id'] = this.id;
    if (this.pointOfInterestCategories != null) {
      data['point_of_interest_categories'] =
          this.pointOfInterestCategories!.map((v) => v.toJson()).toList();
    }
    data['fax'] = this.fax;
    data['breve'] = this.breve;
    data['longitude'] = this.longitude;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['opening_times_url'] = this.openingTimesUrl;
    data['circoscrizione'] = this.circoscrizione;
    data['entry'] = this.entry;
    data['nome_alternativo'] = this.nomeAlternativo;
    data['fullscreen'] = this.fullscreen;
    data['phone'] = this.phone;
    data['identificativo'] = this.identificativo;
    data['name'] = this.name;
    data['excerpt'] = this.excerpt;
    data['galleria_video'] = this.galleriaVideo;
    data['servizi'] = this.servizi;
    data['latitude'] = this.latitude;
    data['facebook_link'] = this.facebookLink;
    data['description'] = this.description;
    data['id_open_data'] = this.idOpenData;
    data['modalita_accesso'] = this.modalitaAccesso;
    data['open_data_identifier'] = this.openDataIdentifier;
    data['cap'] = this.cap;
    data['updated_at'] = this.updatedAt;
    data['ulteriori_informazioni'] = this.ulterioriInformazioni;
    data['gallery_id'] = this.galleryId;
    data['address'] = this.address;
    data['trip_advisor_link'] = this.tripAdvisorLink;
    data['is_always_open'] = this.isAlwaysOpen;
    data['opening_times'] = this.openingTimes;
    data['url'] = this.url;
    data['municipality_name'] = this.municipalityName;
    data['mail2'] = this.mail2;
    data['quartiere'] = this.quartiere;
    if (this.argomenti != null) {
      data['argomenti'] = this.argomenti!.map((v) => v.toJson()).toList();
    }
    data['web_site'] = this.webSite;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PointOfInterestCategories {
  String? name;
  int? id;
  String? color;

  PointOfInterestCategories({this.name, this.id, this.color});

  PointOfInterestCategories.fromJson(Map<String, dynamic> json) {
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

class Images {
  MImagesDTO? image;
  String? name;

  Images({this.image, this.name});

  Images.fromJson(Map<String, dynamic> json) {
    image =
        json['image'] != null ? new MImagesDTO.fromJson(json['image']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Argomenti {
  int? id;
  String? name;

  Argomenti({this.id, this.name});

  Argomenti.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
