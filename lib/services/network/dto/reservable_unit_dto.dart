import 'package:pine/dto/dto.dart';

class ReservableUnitDto extends DTO {
  String? titolo;
  int? id;

  ReservableUnitDto({this.titolo, this.id});

  ReservableUnitDto.fromJson(Map<String, dynamic> json) {
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
