import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class CivilDefenceAlertsNewsDTO extends DTO with EquatableMixin{
	String? color;
	String? name;
	String? endAt;
	String? startAt;

	CivilDefenceAlertsNewsDTO({this.color, this.name, this.endAt, this.startAt});

	CivilDefenceAlertsNewsDTO.fromJson(Map<String, dynamic> json) {
		color = json['color'];
		name = json['name'];
		endAt = json['end_at'];
		startAt = json['start_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['color'] = this.color;
		data['name'] = this.name;
		data['end_at'] = this.endAt;
		data['start_at'] = this.startAt;
		return data;


	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [
    color,
    name,
    endAt,
    startAt
   ];
}