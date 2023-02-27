class FeaturesDTO {
	bool? garbageCalendar;
	bool? enhancedIssues;
	bool? issues;
	bool? translations;

	FeaturesDTO({this.garbageCalendar, this.enhancedIssues, this.issues, this.translations});

	FeaturesDTO.fromJson(Map<String, dynamic> json) {
		garbageCalendar = json['garbage_calendar'];
		enhancedIssues = json['enhanced_issues'];
		issues = json['issues'];
		translations = json['translations'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['garbage_calendar'] = this.garbageCalendar;
		data['enhanced_issues'] = this.enhancedIssues;
		data['issues'] = this.issues;
		data['translations'] = this.translations;
		return data;
	}
}