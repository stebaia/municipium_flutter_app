class LissiPresentationTemplateInfo {
  final String presentationTemplateName;
  String? externalUserId;

  LissiPresentationTemplateInfo({
    required this.presentationTemplateName,
    this.externalUserId,
  });

  factory LissiPresentationTemplateInfo.fromJson(Map<String, dynamic> json) {
    return LissiPresentationTemplateInfo(
      presentationTemplateName: json['presentationTemplateName'],
      externalUserId: json['externalUserId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'presentationTemplateName': presentationTemplateName,
      'externalUserId': externalUserId,
    };
  }
}