class DigitalDossierServicesDTO {
	String? mercati;
	String? notifiche;

	DigitalDossierServicesDTO({this.mercati, this.notifiche});

	DigitalDossierServicesDTO.fromJson(Map<String, dynamic> json) {
		mercati = json['mercati'];
		notifiche = json['notifiche'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mercati'] = this.mercati;
		data['notifiche'] = this.notifiche;
		return data;
	}
}
