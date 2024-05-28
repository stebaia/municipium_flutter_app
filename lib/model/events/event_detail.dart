import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/services/network/dto/contact_point_dto.dart';
import 'package:municipium/services/network/dto/event_detail_dto.dart';

class EventDetail implements Equatable {
  int? id;
  String? title;
  String? content;
  String? url;
  int? municipalityId;
  List<PuntiContatto>? puntiContatto;
  String? municipalityName;
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
  String? tipo;
  String? breve;
  String? subtitle;
  String? rivoltoA;
  int? parentId;
  String? costo;
  String? patrocinatoDa;
  String? sponsorPnrr;
  String? ulterioriInformazioni;
  MunicipiumImage image;
  List<MunicipiumImage>? images;
  List<EventCategories>? eventCategories;
  List<Attachments>? attachments;
  String? translation;
  List<Argomento>? argomenti;
  List<Persona>? persone;
  Parent? parent;
  List<SupportatoDa>? supportatoDa;
  List<Childs>? childs;
  Luogo? luogo;

  EventDetail(
      {required this.id,
      required this.title,
      required this.content,
      required this.url,
      required this.municipalityId,
      required this.puntiContatto,
      required this.municipalityName,
      required this.publishedAt,
      required this.startDate,
      required this.endDate,
      required this.startTime,
      required this.endTime,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.featured,
      required this.updatedAt,
      required this.createdAt,
      required this.tipo,
      required this.breve,
      required this.subtitle,
      required this.rivoltoA,
      required this.parentId,
      required this.costo,
      required this.patrocinatoDa,
      required this.sponsorPnrr,
      required this.ulterioriInformazioni,
      required this.image,
      required this.images,
      required this.eventCategories,
      required this.attachments,
      required this.translation,
      required this.argomenti,
      required this.persone,
      required this.parent,
      required this.supportatoDa,
      required this.childs,
      required this.luogo});

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        url,
        municipalityId,
        puntiContatto,
        municipalityName,
        publishedAt,
        startDate,
        endDate,
        startTime,
        endTime,
        address,
        latitude,
        longitude,
        featured,
        updatedAt,
        createdAt,
        tipo,
        breve,
        subtitle,
        rivoltoA,
        parentId,
        costo,
        patrocinatoDa,
        sponsorPnrr,
        ulterioriInformazioni,
        image,
        images,
        eventCategories,
        attachments,
        translation,
        argomenti,
        persone,
        parent,
        supportatoDa,
        childs,
        luogo
      ];

  @override
  bool? get stringify => true;
}
