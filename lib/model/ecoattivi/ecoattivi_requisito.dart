class EcoattiviRequisito {
  int? requisitoId;
  String? requisitoDesc;
  String? requisitoInfoHtml;
  int? tipo;
  List<String>? opzioni;
  bool? obbligatorio;
  String? valore;

  // Costruttore
  EcoattiviRequisito({
    this.requisitoId,
    this.requisitoDesc,
    this.requisitoInfoHtml,
    this.tipo,
    this.opzioni,
    this.obbligatorio,
    this.valore,
  });
}
