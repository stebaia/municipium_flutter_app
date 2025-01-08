class Survey {
  final int id;
  final String title;
  final String startDate;
  final String endDate;
  final bool visible;
  final bool voted;

  Survey({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.visible,
    required this.voted,
  });

  Survey.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        startDate = json['start_date'] as String,
        endDate = json['end_date'] as String,
        visible = json['visible'] as bool,
        voted = json['voted'] as bool;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'start_date': startDate,
      'end_date': endDate,
      'visible': visible,
      'voted': voted,
    };
  }
}