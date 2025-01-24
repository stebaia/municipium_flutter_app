import 'package:pine/dto/dto.dart';

class EcoattiviMessageResponse {
  int? resultCode;
  String? errorMessage;
  List<EcoattiviMessaggioDto>? messaggi;

  EcoattiviMessageResponse({this.resultCode, this.errorMessage, this.messaggi});

  EcoattiviMessageResponse.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    errorMessage = json['errorMessage'];
    if (json['messaggi'] != null) {
      messaggi = <EcoattiviMessaggioDto>[];
      json['messaggi'].forEach((v) {
        messaggi!.add(new EcoattiviMessaggioDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    data['errorMessage'] = this.errorMessage;
    if (this.messaggi != null) {
      data['messaggi'] = this.messaggi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EcoattiviMessaggioDto extends DTO {
  int? messaggioId;
  bool? letto;
  String? data;
  String? titolo;
  String? url;

  EcoattiviMessaggioDto(
      {this.messaggioId, this.letto, this.data, this.titolo, this.url});

  EcoattiviMessaggioDto.fromJson(Map<String, dynamic> json) {
    messaggioId = json['messaggioId'];
    letto = json['letto'];
    data = json['data'];
    titolo = json['titolo'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messaggioId'] = this.messaggioId;
    data['letto'] = this.letto;
    data['data'] = this.data;
    data['titolo'] = this.titolo;
    data['url'] = this.url;
    return data;
  }
}
