class BasicResponse {
  int? resultCode;
  String? errorMessage;

  BasicResponse({required this.errorMessage, required this.resultCode});

  factory BasicResponse.fromJson(Map<String, dynamic> json) {
    return BasicResponse(
      errorMessage: json['errorMessage'] as String?,
      resultCode: json['resultCode'] as int?,
    );
  }
}

class StringResponse {
  String? description;

  StringResponse({required this.description});

  factory StringResponse.fromJson(Map<String, dynamic> json) {
    return StringResponse(description: json['description'] as String?);
  }
}
