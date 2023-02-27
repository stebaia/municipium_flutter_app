class ProvinceDTO {
	String? name;
	String? initials;
	int? id;

	ProvinceDTO({this.name, this.initials, this.id});

	ProvinceDTO.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		initials = json['initials'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['initials'] = this.initials;
		data['id'] = this.id;
		return data;
	}
}