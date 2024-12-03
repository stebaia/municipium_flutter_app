import 'package:pine/dto/dto.dart';

class ResponseDto extends DTO {
  int? resultCode;
  String? errorMessage;

  ResponseDto({
    this.resultCode,
    this.errorMessage,
  });

  ResponseDto.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMessage'] = this.errorMessage;
    data['resultCode'] = this.resultCode;

    return data;
  }
}
