import 'package:pine/pine.dart';

class SelfPaymentDTO extends DTO {
  String? area;
  int? areaOrdinamento;
  List<PaymentTypeDTO>? tipoPagamenti;
  String? success;

  SelfPaymentDTO(
      {this.area, this.areaOrdinamento, this.tipoPagamenti, this.success});

  SelfPaymentDTO.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    areaOrdinamento = json['areaOrdinamento'];
    if (json['tipoPagamenti'] != null) {
      tipoPagamenti = <PaymentTypeDTO>[];
      json['tipoPagamenti'].forEach((v) {
        tipoPagamenti!.add(new PaymentTypeDTO.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['areaOrdinamento'] = this.areaOrdinamento;
    if (this.tipoPagamenti != null) {
      data['tipoPagamenti'] =
          this.tipoPagamenti!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class PaymentTypeDTO extends DTO {
  String? descrizione;
  bool? mod3;
  String? codiceDebitoJppa;
  String? codice;
  String? codiceTributo;
  bool? mod1;

  PaymentTypeDTO(
      {this.descrizione,
      this.mod3,
      this.codiceDebitoJppa,
      this.codice,
      this.codiceTributo,
      this.mod1});

  PaymentTypeDTO.fromJson(Map<String, dynamic> json) {
    descrizione = json['descrizione'];
    mod3 = json['mod3'];
    codiceDebitoJppa = json['codiceDebitoJppa'];
    codice = json['codice'];
    codiceTributo = json['codiceTributo'];
    mod1 = json['mod1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descrizione'] = this.descrizione;
    data['mod3'] = this.mod3;
    data['codiceDebitoJppa'] = this.codiceDebitoJppa;
    data['codice'] = this.codice;
    data['codiceTributo'] = this.codiceTributo;
    data['mod1'] = this.mod1;
    return data;
  }
}
