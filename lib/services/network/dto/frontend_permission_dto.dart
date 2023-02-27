class FrontendPermissionsDTO {
	String? news;
	String? pointOfInterests;
	String? civilDefence;
	String? sponsors;
	String? surveys;
	String? garbage;
	String? payment;
	String? services;
	String? digitalDossier;
	String? issues;
	String? events;

	FrontendPermissionsDTO({this.news, this.pointOfInterests, this.civilDefence, this.sponsors, this.surveys, this.garbage, this.payment, this.services, this.digitalDossier, this.issues, this.events});

	FrontendPermissionsDTO.fromJson(Map<String, dynamic> json) {
		news = json['news'];
		pointOfInterests = json['point_of_interests'];
		civilDefence = json['civil_defence'];
		sponsors = json['sponsors'];
		surveys = json['surveys'];
		garbage = json['garbage'];
		payment = json['payment'];
		services = json['services'];
		digitalDossier = json['digital_dossier'];
		issues = json['issues'];
		events = json['events'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['news'] = this.news;
		data['point_of_interests'] = this.pointOfInterests;
		data['civil_defence'] = this.civilDefence;
		data['sponsors'] = this.sponsors;
		data['surveys'] = this.surveys;
		data['garbage'] = this.garbage;
		data['payment'] = this.payment;
		data['services'] = this.services;
		data['digital_dossier'] = this.digitalDossier;
		data['issues'] = this.issues;
		data['events'] = this.events;
		return data;
	}
}