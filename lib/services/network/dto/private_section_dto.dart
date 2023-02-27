class PrivateSectionDTO {
	String? messages;
	String? issues;

	PrivateSectionDTO({this.messages, this.issues});

	PrivateSectionDTO.fromJson(Map<String, dynamic> json) {
		messages = json['messages'];
		issues = json['issues'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['messages'] = this.messages;
		data['issues'] = this.issues;
		return data;
	}
}
