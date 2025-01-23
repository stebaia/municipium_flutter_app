class EcoattiviMovimentoUtente {
  String idUnivoco;
  String origine;
  String descTipoAzione;
  int punti;
  String dataOraUTC;

  // Costruttore
  EcoattiviMovimentoUtente({
    required this.idUnivoco,
    required this.origine,
    required this.descTipoAzione,
    required this.punti,
    required this.dataOraUTC,
  });
}
