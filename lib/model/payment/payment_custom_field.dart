import 'package:municipium/model/payment/field_attribute.dart';

class PaymentCustomField {
  String? tipo;
  String? defaultVal;
  bool? usaPerCalcoloCaselle;
  int? posizione;
  bool? usaPerCausaleAutomatica;
  String? nome;
  bool? usaPerCalcolo;
  String? label;
  bool? required;
  List<FieldAttribute>? attributi;

  PaymentCustomField(
      {required this.tipo,
      required this.defaultVal,
      required this.usaPerCalcoloCaselle,
      required this.posizione,
      required this.usaPerCausaleAutomatica,
      required this.nome,
      required this.usaPerCalcolo,
      required this.label,
      required this.required,
      required this.attributi});
}
