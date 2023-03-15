import 'package:equatable/equatable.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/municipium_image.dart';

class PointOfInterestsItem extends Equatable {
  int? id;
	String? name;
	String? longitude;
	String? latitude;
	String? address;
	String? municipality;
	int? municipalityId;
	String? type;
	List<ItemCategory>? pointOfInterestCategories;
	MunicipiumImage? image;

  PointOfInterestsItem({
    required this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.address,
    this.municipality,
    this.municipalityId,
    this.type,
    this.pointOfInterestCategories,
    this.image,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    id, name, longitude, latitude, address, municipality, municipalityId, type, pointOfInterestCategories, image
  ];


}