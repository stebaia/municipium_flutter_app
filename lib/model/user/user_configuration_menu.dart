class UserConfigurationMenu {
  String serviceName;
  int position;
  bool isMandatory;
  bool isRemoved;
  String assetImage;

  UserConfigurationMenu({
    required this.serviceName,
    required this.isMandatory,
    required this.position,
    required this.assetImage,
    this.isRemoved = false
  });
  factory UserConfigurationMenu.fromJson(Map<String, dynamic> json) {
    return UserConfigurationMenu(
      serviceName: json['serviceName'],
      position: json['position'],
      isMandatory: json['isMandatory'],
      assetImage: json['image'],
      isRemoved: json['isRemoved'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'position': position,
      'isMandatory': isMandatory,
      'image' : assetImage,
      'isRemoved': isRemoved
    };
  }
}