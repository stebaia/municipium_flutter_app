import 'package:pine/pine.dart';

class PaymentResponseDTO extends DTO {
  String? success;
  Configuration? configurazione;
  PaymentResponseType? tipoPagamento;
  List<PaymentCustomFieldDTO>? campiCustom;
  String? tipoIstanzaPagamento;
  String? dataScadenza;

  PaymentResponseDTO(
      {this.success,
      this.configurazione,
      this.tipoPagamento,
      this.campiCustom,
      this.tipoIstanzaPagamento,
      this.dataScadenza});

  PaymentResponseDTO.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    configurazione = json['configurazione'] != null
        ? new Configuration.fromJson(json['configurazione'])
        : null;
    tipoPagamento = json['tipoPagamento'] != null
        ? new PaymentResponseType.fromJson(json['tipoPagamento'])
        : null;
    if (json['campiCustom'] != null) {
      campiCustom = <PaymentCustomFieldDTO>[];
      json['campiCustom'].forEach((v) {
        campiCustom!.add(new PaymentCustomFieldDTO.fromJson(v));
      });
    }
    tipoIstanzaPagamento = json['tipoIstanzaPagamento'];
    dataScadenza = json['dataScadenza'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.configurazione != null) {
      data['configurazione'] = this.configurazione!.toJson();
    }
    if (this.tipoPagamento != null) {
      data['tipoPagamento'] = this.tipoPagamento!.toJson();
    }
    if (this.campiCustom != null) {
      data['campiCustom'] = this.campiCustom!.map((v) => v.toJson()).toList();
    }
    data['tipoIstanzaPagamento'] = this.tipoIstanzaPagamento;
    data['dataScadenza'] = this.dataScadenza;
    return data;
  }
}

class FieldAttributeDTO extends DTO {
  String? valore;
  String? nome;
  String? label;

  FieldAttributeDTO();

  FieldAttributeDTO.fromJson(Map<String, dynamic> json) {
    valore = json['valore'];
    nome = json['nome'];
    label = json['label'];
  }
}

class PaymentCustomFieldDTO extends DTO {
  String? tipo;
  String? defaultVal;
  bool? usaPerCalcoloCaselle;
  int? posizione;
  bool? usaPerCausaleAutomatica;
  String? nome;
  bool? usaPerCalcolo;
  String? label;
  bool? required;
  List<FieldAttributeDTO>? attributi;

  PaymentCustomFieldDTO();

  PaymentCustomFieldDTO.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    defaultVal = json['defaultVal'];
    if (json['attributi'] != null) {
      attributi = <FieldAttributeDTO>[];
      json['attributi'].forEach((v) {
        attributi!.add(new FieldAttributeDTO.fromJson(v));
      });
    }
    usaPerCalcoloCaselle = json['usaPerCalcoloCaselle'];
    posizione = json['posizione'];
    usaPerCalcoloCaselle = json['usaPerCalcoloCaselle'];
    required = json['required'];
    nome = json['nome'];
    usaPerCalcolo = json['usaPerCalcolo'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Configuration {
  String? codiceIPA;
  String? endpoint;
  String? logoEnteMod3Base64;
  String? codServizioDefault;
  bool? loginModalita3;
  int? sleeptime;
  String? fromMailDescription;
  String? endpointRicevuta;
  String? endpointAvvisatura;
  String? fromMail;
  String? endpointEstrattoConto;
  String? testoInformativaCanaliDigitali;

  Configuration(
      {this.codiceIPA,
      this.endpoint,
      this.logoEnteMod3Base64,
      this.codServizioDefault,
      this.loginModalita3,
      this.sleeptime,
      this.fromMailDescription,
      this.endpointRicevuta,
      this.endpointAvvisatura,
      this.fromMail,
      this.endpointEstrattoConto,
      this.testoInformativaCanaliDigitali});

  Configuration.fromJson(Map<String, dynamic> json) {
    codiceIPA = json['codiceIPA'];
    endpoint = json['endpoint'];
    logoEnteMod3Base64 = json['logoEnteMod3Base64'];
    codServizioDefault = json['codServizioDefault'];
    loginModalita3 = json['loginModalita3'];
    sleeptime = json['sleeptime'];
    fromMailDescription = json['fromMailDescription'];
    endpointRicevuta = json['endpointRicevuta'];
    endpointAvvisatura = json['endpointAvvisatura'];
    fromMail = json['fromMail'];
    endpointEstrattoConto = json['endpointEstrattoConto'];
    testoInformativaCanaliDigitali = json['testoInformativaCanaliDigitali'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codiceIPA'] = this.codiceIPA;
    data['endpoint'] = this.endpoint;
    data['logoEnteMod3Base64'] = this.logoEnteMod3Base64;
    data['codServizioDefault'] = this.codServizioDefault;
    data['loginModalita3'] = this.loginModalita3;
    data['sleeptime'] = this.sleeptime;
    data['fromMailDescription'] = this.fromMailDescription;
    data['endpointRicevuta'] = this.endpointRicevuta;
    data['endpointAvvisatura'] = this.endpointAvvisatura;
    data['fromMail'] = this.fromMail;
    data['endpointEstrattoConto'] = this.endpointEstrattoConto;
    data['testoInformativaCanaliDigitali'] =
        this.testoInformativaCanaliDigitali;
    return data;
  }
}

class PaymentResponseType {
  bool? pagabile;
  bool? anagraficaGiuridicaRidotta;
  String? codiceTipoPagamento;
  String? importoErrMess;
  String? codServizioMod3;
  bool? oneri;
  String? codServizioMod1;
  String? codiceTipoDebitoJPPA;
  bool? anagraficaFisicaRidotta;
  bool? raggruppato;
  bool? modalita3;
  String? codiceTributo;
  bool? salvabile;
  int? giorniScadenza;
  bool? quantita;
  bool? causaleAutomatica;
  bool? abilitaDettagliPagamento;
  bool? importoCalcolatoCaselle;
  bool? nascondiInfoResidenza;
  String? descrizioneTipoPagamento;
  bool? nascondiDataScad;
  bool? importoCalcolato;
  bool? pagamentoTerzi;
  String? descrizioneTipoDebito;
  int? areaId;
  bool? importoEditabile;
  bool? autenticatoMunicipium;
  int? importoDefault;

  PaymentResponseType(
      {this.pagabile,
      this.anagraficaGiuridicaRidotta,
      this.codiceTipoPagamento,
      this.importoErrMess,
      this.codServizioMod3,
      this.oneri,
      this.codServizioMod1,
      this.codiceTipoDebitoJPPA,
      this.anagraficaFisicaRidotta,
      this.raggruppato,
      this.modalita3,
      this.codiceTributo,
      this.salvabile,
      this.giorniScadenza,
      this.quantita,
      this.causaleAutomatica,
      this.abilitaDettagliPagamento,
      this.importoCalcolatoCaselle,
      this.nascondiInfoResidenza,
      this.descrizioneTipoPagamento,
      this.nascondiDataScad,
      this.importoCalcolato,
      this.pagamentoTerzi,
      this.descrizioneTipoDebito,
      this.areaId,
      this.importoEditabile,
      this.autenticatoMunicipium,
      this.importoDefault});

  PaymentResponseType.fromJson(Map<String, dynamic> json) {
    pagabile = json['pagabile'];
    anagraficaGiuridicaRidotta = json['anagraficaGiuridicaRidotta'];
    codiceTipoPagamento = json['codiceTipoPagamento'];
    importoErrMess = json['importoErrMess'];
    codServizioMod3 = json['codServizioMod3'];
    oneri = json['oneri'];
    codServizioMod1 = json['codServizioMod1'];
    codiceTipoDebitoJPPA = json['codiceTipoDebitoJPPA'];
    anagraficaFisicaRidotta = json['anagraficaFisicaRidotta'];
    raggruppato = json['raggruppato'];
    modalita3 = json['modalita3'];
    codiceTributo = json['codiceTributo'];
    salvabile = json['salvabile'];
    giorniScadenza = json['giorniScadenza'];
    quantita = json['quantita'];
    causaleAutomatica = json['causale_automatica'];
    abilitaDettagliPagamento = json['abilitaDettagliPagamento'];
    importoCalcolatoCaselle = json['importoCalcolatoCaselle'];
    nascondiInfoResidenza = json['nascondiInfoResidenza'];
    descrizioneTipoPagamento = json['descrizioneTipoPagamento'];
    nascondiDataScad = json['nascondiDataScad'];
    importoCalcolato = json['importoCalcolato'];
    pagamentoTerzi = json['pagamentoTerzi'];
    descrizioneTipoDebito = json['descrizioneTipoDebito'];
    areaId = json['areaId'];
    importoEditabile = json['importoEditabile'];
    autenticatoMunicipium = json['autenticatoMunicipium'];
    importoDefault = json['importoDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pagabile'] = this.pagabile;
    data['anagraficaGiuridicaRidotta'] = this.anagraficaGiuridicaRidotta;
    data['codiceTipoPagamento'] = this.codiceTipoPagamento;
    data['importoErrMess'] = this.importoErrMess;
    data['codServizioMod3'] = this.codServizioMod3;
    data['oneri'] = this.oneri;
    data['codServizioMod1'] = this.codServizioMod1;
    data['codiceTipoDebitoJPPA'] = this.codiceTipoDebitoJPPA;
    data['anagraficaFisicaRidotta'] = this.anagraficaFisicaRidotta;
    data['raggruppato'] = this.raggruppato;
    data['modalita3'] = this.modalita3;
    data['codiceTributo'] = this.codiceTributo;
    data['salvabile'] = this.salvabile;
    data['giorniScadenza'] = this.giorniScadenza;
    data['quantita'] = this.quantita;
    data['causale_automatica'] = this.causaleAutomatica;
    data['abilitaDettagliPagamento'] = this.abilitaDettagliPagamento;
    data['importoCalcolatoCaselle'] = this.importoCalcolatoCaselle;
    data['nascondiInfoResidenza'] = this.nascondiInfoResidenza;
    data['descrizioneTipoPagamento'] = this.descrizioneTipoPagamento;
    data['nascondiDataScad'] = this.nascondiDataScad;
    data['importoCalcolato'] = this.importoCalcolato;
    data['pagamentoTerzi'] = this.pagamentoTerzi;
    data['descrizioneTipoDebito'] = this.descrizioneTipoDebito;
    data['areaId'] = this.areaId;
    data['importoEditabile'] = this.importoEditabile;
    data['autenticatoMunicipium'] = this.autenticatoMunicipium;
    data['importoDefault'] = this.importoDefault;
    return data;
  }
}
