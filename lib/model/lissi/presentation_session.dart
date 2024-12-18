class LissiPresentationSession {
  final String presentationSessionId;
  final String presentationTemplateName;
  final String presentationRequestUri;
  final List<dynamic> presentedCredentials;
  final String state;

  LissiPresentationSession({
    required this.presentationSessionId,
    required this.presentationTemplateName,
    required this.presentationRequestUri,
    required this.presentedCredentials,
    required this.state,
  });

  factory LissiPresentationSession.fromJson(Map<String, dynamic> json) {
    return LissiPresentationSession(
      presentationSessionId: json['presentationSessionId'],
      presentationTemplateName: json['presentationTemplateName'],
      presentationRequestUri: json['presentationRequestUri'],
      presentedCredentials: json['presentedCredentials'] ?? [],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'presentationSessionId': presentationSessionId,
      'presentationTemplateName': presentationTemplateName,
      'presentationRequestUri': presentationRequestUri,
      'presentedCredentials': presentedCredentials,
      'state': state,
    };
  }
}