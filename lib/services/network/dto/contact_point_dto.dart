class PuntiContattos {
  int? tipo;
  String? titolo;
  String? valore;
  String? label;

  PuntiContattos({this.tipo, this.titolo, this.valore, this.label});

  PuntiContattos.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    titolo = json['titolo'];
    valore = json['valore'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['titolo'] = this.titolo;
    data['valore'] = this.valore;
    data['label'] = this.label;
    return data;
  }
}
