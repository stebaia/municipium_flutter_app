class IdpModel {
  String? organizationDisplayName;
  String? logoUri;
  String? entityId;

  IdpModel({this.organizationDisplayName, this.logoUri, this.entityId});

  IdpModel.fromJson(Map<String, dynamic> json) {
    organizationDisplayName = json['organization_display_name'];
    logoUri = json['logo_uri'];
    entityId = json['entity_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization_display_name'] = this.organizationDisplayName;
    data['logo_uri'] = this.logoUri;
    data['entity_id'] = this.entityId;
    return data;
  }
}