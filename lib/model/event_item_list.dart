import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/item_category.dart';

class EventItemList extends Equatable {
  final int id;
  final String title;
  final MunicipiumImage images;
  final List<ItemCategory> eventCategories;
  final String publishedAt;

  const EventItemList(
      {required this.id,
      required this.title,
      required this.images,
      required this.eventCategories,
      required this.publishedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, images, eventCategories, publishedAt];
}
