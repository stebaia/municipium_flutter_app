class Ecostop {
  int? ecostopId;
  String? titolo;
  String? descHtml;
  String? desctxt;
  String? urlEcoStop;
  String? indirizzo;
  String? comune;
  String? provincia;
  String? regione;
  double? lat; // Assumendo che sia un float come nel modello iOS
  double? lon; // Assumendo che sia un float come nel modello iOS
  int? tipoId;
  String? tipoDesc;
  String? tipoColore;

  // Costruttore
  Ecostop({
    this.ecostopId,
    this.titolo,
    this.descHtml,
    this.desctxt,
    this.urlEcoStop,
    this.indirizzo,
    this.comune,
    this.provincia,
    this.regione,
    this.lat,
    this.lon,
    this.tipoId,
    this.tipoDesc,
    this.tipoColore,
  });
}
