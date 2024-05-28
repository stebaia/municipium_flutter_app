import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class CategoryPoiDTO extends DTO with EquatableMixin{

  int? id;
  String? name;
  String? color;
  List<int>? idPoi;
  int? numberOfPointOfInterest;

  CategoryPoiDTO(
      {this.id,
      this.name,
      this.color,
      this.idPoi,
      this.numberOfPointOfInterest});

  CategoryPoiDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    idPoi = json['id_poi'].cast<int>();
    numberOfPointOfInterest = json['number_of_point_of_interest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['id_poi'] = this.idPoi;
    data['number_of_point_of_interest'] = this.numberOfPointOfInterest;
    return data;
  }

   @override
   // TODO: implement props
   List<Object?> get props => [
    color,
    name,
    id,
    idPoi,
    numberOfPointOfInterest
   ];
}