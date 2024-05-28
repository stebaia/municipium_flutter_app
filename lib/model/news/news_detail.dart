import 'package:equatable/equatable.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/services/network/dto/attachment_dto.dart';
import 'package:municipium/services/network/dto/civil_defence_alerts_news_dto.dart';

class NewsDetail extends Equatable {
  final int id;
  final String title;
  final String content;
  final MunicipiumImage image;
  final String slug;
  final int? galleryId;
  final String? address;
  final String? url;
  final List<ItemCategory> newsCategories;
  final String publishedAt;
  final List<CivilDefenceAlertsNewsDTO>? civilDefenceAlerts;
  final List<MunicipiumImage>? images;
  final List<AttachmentsDTO>? attachments;

  const NewsDetail(
      {required this.id,
      required this.title,
      required this.images,
      required this.newsCategories,
      required this.publishedAt,
      required this.address,
      required this.url,
      required this.attachments,
      required this.civilDefenceAlerts,
      required this.content,
      required this.galleryId,
      required this.image,
      required this.slug});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        images,
        newsCategories,
        publishedAt,
        newsCategories,
        publishedAt,
        address,
        url,
        attachments,
        civilDefenceAlerts,
        content,
        galleryId,
        image,
        slug
      ];
}
