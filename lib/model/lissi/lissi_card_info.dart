class LissiCardInfo {
  final String presentationSessionId;
  final String presentationTemplateName;
  final String? callBackUrl;
  final String presentationRequestUri;
  final List<LissiPresentedCredential> presentedCredentials;
  final String state;

  LissiCardInfo({
    required this.presentationSessionId,
    required this.presentationTemplateName,
    this.callBackUrl,
    required this.presentationRequestUri,
    required this.presentedCredentials,
    required this.state,
  });

  factory LissiCardInfo.fromJson(Map<String, dynamic> json) {
    return LissiCardInfo(
      presentationSessionId: json['presentationSessionId'],
      presentationTemplateName: json['presentationTemplateName'],
      callBackUrl: json['callBackUrl'],
      presentationRequestUri: json['presentationRequestUri'],
      presentedCredentials: (json['presentedCredentials'] as List)
          .map((e) => LissiPresentedCredential.fromJson(e))
          .toList(),
      state: json['state'],
    );
  }
}

class LissiPresentedCredential {
  final String type;
  final String issuer;
  final List<LissiPresentedClaim> presentedClaims;
  final List<String> issuerNames;
  final String queryId;

  LissiPresentedCredential({
    required this.type,
    required this.issuer,
    required this.presentedClaims,
    required this.issuerNames,
    required this.queryId,
  });

  factory LissiPresentedCredential.fromJson(Map<String, dynamic> json) {
    return LissiPresentedCredential(
      type: json['type'],
      issuer: json['issuer'],
      presentedClaims: (json['presentedClaims'] as List)
          .map((e) => LissiPresentedClaim.fromJson(e))
          .toList(),
      issuerNames: List<String>.from(json['issuerNames']),
      queryId: json['queryId'],
    );
  }
}

class LissiPresentedClaim {
  final String claimName;
  final String claimValue;

  LissiPresentedClaim({
    required this.claimName,
    required this.claimValue,
  });

  factory LissiPresentedClaim.fromJson(Map<String, dynamic> json) {
    return LissiPresentedClaim(
      claimName: json['claimName'],
      claimValue: json['claimValue'],
    );
  }
}