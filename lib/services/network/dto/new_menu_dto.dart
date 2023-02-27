import 'package:municipium/services/network/dto/civil_defence_dto.dart';
import 'package:municipium/services/network/dto/dms_dto.dart';
import 'package:municipium/services/network/dto/garbage_dto.dart';

class NewMenuDTO {
	String? news;
	String? issue;
	String? penalties;
	String? surveys;
	GarbageDTO? garbage;
	String? ecoattivi;
	String? poi;
	String? services;
	DmsDTO? dms;
	String? digitalDossier;
	CivilDefenceDTO? civilDefence;
	String? payment;
	String? events;

	NewMenuDTO({this.news, this.issue, this.penalties, this.surveys, this.garbage, this.ecoattivi, this.poi, this.services, this.dms, this.digitalDossier, this.civilDefence, this.payment, this.events});

	NewMenuDTO.fromJson(Map<String, dynamic> json) {
		news = json['news'];
		issue = json['issue'];
		penalties = json['penalties'];
		surveys = json['surveys'];
		garbage = json['garbage'] != null ? new GarbageDTO.fromJson(json['garbage']) : null;
		ecoattivi = json['ecoattivi'];
		poi = json['poi'];
		services = json['services'];
		dms = json['dms'] != null ? new DmsDTO.fromJson(json['dms']) : null;
		digitalDossier = json['digital_dossier'];
		civilDefence = json['civil_defence'] != null ? new CivilDefenceDTO.fromJson(json['civil_defence']) : null;
		payment = json['payment'];
		events = json['events'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['news'] = this.news;
		data['issue'] = this.issue;
		data['penalties'] = this.penalties;
		data['surveys'] = this.surveys;
		if (this.garbage != null) {
      data['garbage'] = this.garbage!.toJson();
    }
		data['ecoattivi'] = this.ecoattivi;
		data['poi'] = this.poi;
		data['services'] = this.services;
		if (this.dms != null) {
      data['dms'] = this.dms!.toJson();
    }
		data['digital_dossier'] = this.digitalDossier;
		if (this.civilDefence != null) {
      data['civil_defence'] = this.civilDefence!.toJson();
    }
		data['payment'] = this.payment;
		data['events'] = this.events;
		return data;
	}
}