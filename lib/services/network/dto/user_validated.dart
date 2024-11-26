import 'package:pine/dto/dto.dart';

class UserValidated {
  UserValidatedData? data;
  String? errorMessage;
  int? errorCode;

  UserValidated({
    this.data,
    this.errorMessage,
    this.errorCode,
  });

  // Factory constructor to create an instance from JSON
  factory UserValidated.fromJson(Map<String, dynamic> json) {
    return UserValidated(
      data: json['data'] != null
          ? UserValidatedData.fromJson(json['data'])
          : null,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as int?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'errorMessage': errorMessage,
      'errorCode': errorCode,
    };
  }
}

class UserValidatedData {
  int? resultCode;
  bool? isNewEcoattivi;
  String? token;
  String? errorMessage;

  UserValidatedData({
    this.resultCode,
    this.isNewEcoattivi,
    this.token,
    this.errorMessage,
  });

  // Factory constructor to create an instance from JSON
  factory UserValidatedData.fromJson(Map<String, dynamic> json) {
    return UserValidatedData(
      resultCode: json['resultCode'] as int?,
      isNewEcoattivi: json['isNewEcoattivi'] == 1,
      token: json['token'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'resultCode': resultCode,
      'isNewEcoattivi': isNewEcoattivi,
      'token': token,
      'errorMessage': errorMessage,
    };
  }
}
