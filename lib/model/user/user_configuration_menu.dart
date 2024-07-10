class UserConfigurationMenu {
  String serviceName;
  int position;
  bool isMandatory;
  bool isRemoved;

  UserConfigurationMenu({
    required this.serviceName,
    required this.isMandatory,
    required this.position,
    this.isRemoved = false
  });
  factory UserConfigurationMenu.fromJson(Map<String, dynamic> json) {
    return UserConfigurationMenu(
      serviceName: json['serviceName'],
      position: json['position'],
      isMandatory: json['isMandatory'],
      isRemoved: json['isRemoved'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'position': position,
      'isMandatory': isMandatory,
      'isRemoved': isRemoved
    };
  }
}