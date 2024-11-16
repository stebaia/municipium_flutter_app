class DashboardMenu {
  late String image;
  late String serviceName;
  late bool isMandatory;
  late int position;
  late String slug;

  DashboardMenu(
      {required this.image,
      required this.serviceName,
      required this.isMandatory,
      required this.position,
      required this.slug});

  DashboardMenu.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    serviceName = json['service_name'] ?? '';
    isMandatory = json['is_mandatory'] ?? '';
    position = json['position'] ?? '';
    slug = json['slug'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['service_name'] = this.serviceName;
    data['is_mandatory'] = this.isMandatory;
    data['position'] = this.position;
    data['slug'] = this.slug;
    return data;
  }
}
