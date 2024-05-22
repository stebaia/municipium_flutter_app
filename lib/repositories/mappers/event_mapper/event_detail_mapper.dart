import 'package:municipium/model/events/event_detail.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/services/network/dto/event_detail_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EventDetailMapper extends DTOMapper<EventDetailDto, EventDetail> {
  @override
  EventDetail fromDTO(EventDetailDto dto) {
    MunicipiumImageMapper mapperImages = MunicipiumImageMapper();
    return EventDetail(
        id: dto.id,
        title: dto.title,
        content: dto.content,
        url: dto.url,
        municipalityId: dto.municipalityId,
        municipalityName: dto.municipalityName,
        publishedAt: dto.publishedAt,
        startDate: dto.startDate,
        endDate: dto.endDate,
        startTime: dto.startTime,
        endTime: dto.endTime,
        address: dto.address,
        latitude: dto.latitude,
        longitude: dto.longitude,
        featured: dto.featured,
        updatedAt: dto.updatedAt,
        createdAt: dto.createdAt,
        tipo: dto.tipo,
        breve: dto.breve,
        subtitle: dto.subtitle,
        costo: dto.costo,
        sponsorPnrr: dto.sponsorPnrr,
        rivoltoA: dto.rivoltoA,
        ulterioriInformazioni: dto.ulterioriInformazioni,
        translation: dto.translation,
        parentId: dto.parentId,
        patrocinatoDa: dto.patrocinatoDa,
        image: mapperImages.fromDTO(dto.image!),
        argomenti: dto.argomenti,
        persone: dto.persone,
        attachments: dto.attachments,
        puntiContatto: dto.puntiContatto,
        parent: dto.parent,
        childs: dto.childs,
        eventCategories: dto.eventCategories,
        supportatoDa: dto.supportatoDa,
        images: dto.images?.map((e) => mapperImages.fromDTO(e)).toList(),
        luogo: dto.luogo);
  }

  @override
  EventDetailDto toDTO(EventDetail model) {
    return EventDetailDto();
  }
}
