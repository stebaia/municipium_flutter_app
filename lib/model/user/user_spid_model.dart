class SpidUserModel {
  String? authId;
  Null? aziendaDenominazione;
  Null? aziendaPIVA;
  Null? aziendaSedelegale;
  Null? aziendaSedelegaleCitta;
  String? cellulare;
  String? codiceFiscale;
  String? cognome;
  String? dataInserimento;
  bool? demo;
  Null? domicilioCap;
  Null? domicilioCitta;
  Null? domicilioIndirizzo;
  Null? domicilioProvincia;
  Null? domicilioStato;
  Null? fax;
  Null? lavoro;
  String? livelloAutenticazione;
  Null? livelloPasswordPolicy;
  String? mailAddress;
  String? nascitaData;
  String? nascitaLuogo;
  String? nascitaProvincia;
  String? nome;
  Null? pec;
  Null? professionistaAlbo;
  Null? professionistaEstremiAlbo;
  Null? residenzaCap;
  Null? residenzaCitta;
  Null? residenzaIndirizzo;
  Null? residenzaProvincia;
  Null? residenzaStato;
  String? sesso;
  Null? telefono;
  String? tipoSoggetto;
  Null? titolo;

  SpidUserModel(
      {this.authId,
      this.aziendaDenominazione,
      this.aziendaPIVA,
      this.aziendaSedelegale,
      this.aziendaSedelegaleCitta,
      this.cellulare,
      this.codiceFiscale,
      this.cognome,
      this.dataInserimento,
      this.demo,
      this.domicilioCap,
      this.domicilioCitta,
      this.domicilioIndirizzo,
      this.domicilioProvincia,
      this.domicilioStato,
      this.fax,
      this.lavoro,
      this.livelloAutenticazione,
      this.livelloPasswordPolicy,
      this.mailAddress,
      this.nascitaData,
      this.nascitaLuogo,
      this.nascitaProvincia,
      this.nome,
      this.pec,
      this.professionistaAlbo,
      this.professionistaEstremiAlbo,
      this.residenzaCap,
      this.residenzaCitta,
      this.residenzaIndirizzo,
      this.residenzaProvincia,
      this.residenzaStato,
      this.sesso,
      this.telefono,
      this.tipoSoggetto,
      this.titolo});

  SpidUserModel.fromJson(Map<String, dynamic> json) {
    authId = json['authId'];
    aziendaDenominazione = json['aziendaDenominazione'];
    aziendaPIVA = json['aziendaPIVA'];
    aziendaSedelegale = json['aziendaSedelegale'];
    aziendaSedelegaleCitta = json['aziendaSedelegaleCitta'];
    cellulare = json['cellulare'];
    codiceFiscale = json['codiceFiscale'];
    cognome = json['cognome'];
    dataInserimento = json['dataInserimento'];
    demo = json['demo'];
    domicilioCap = json['domicilioCap'];
    domicilioCitta = json['domicilioCitta'];
    domicilioIndirizzo = json['domicilioIndirizzo'];
    domicilioProvincia = json['domicilioProvincia'];
    domicilioStato = json['domicilioStato'];
    fax = json['fax'];
    lavoro = json['lavoro'];
    livelloAutenticazione = json['livelloAutenticazione'];
    livelloPasswordPolicy = json['livelloPasswordPolicy'];
    mailAddress = json['mailAddress'];
    nascitaData = json['nascitaData'];
    nascitaLuogo = json['nascitaLuogo'];
    nascitaProvincia = json['nascitaProvincia'];
    nome = json['nome'];
    pec = json['pec'];
    professionistaAlbo = json['professionistaAlbo'];
    professionistaEstremiAlbo = json['professionistaEstremiAlbo'];
    residenzaCap = json['residenzaCap'];
    residenzaCitta = json['residenzaCitta'];
    residenzaIndirizzo = json['residenzaIndirizzo'];
    residenzaProvincia = json['residenzaProvincia'];
    residenzaStato = json['residenzaStato'];
    sesso = json['sesso'];
    telefono = json['telefono'];
    tipoSoggetto = json['tipoSoggetto'];
    titolo = json['titolo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authId'] = this.authId;
    data['aziendaDenominazione'] = this.aziendaDenominazione;
    data['aziendaPIVA'] = this.aziendaPIVA;
    data['aziendaSedelegale'] = this.aziendaSedelegale;
    data['aziendaSedelegaleCitta'] = this.aziendaSedelegaleCitta;
    data['cellulare'] = this.cellulare;
    data['codiceFiscale'] = this.codiceFiscale;
    data['cognome'] = this.cognome;
    data['dataInserimento'] = this.dataInserimento;
    data['demo'] = this.demo;
    data['domicilioCap'] = this.domicilioCap;
    data['domicilioCitta'] = this.domicilioCitta;
    data['domicilioIndirizzo'] = this.domicilioIndirizzo;
    data['domicilioProvincia'] = this.domicilioProvincia;
    data['domicilioStato'] = this.domicilioStato;
    data['fax'] = this.fax;
    data['lavoro'] = this.lavoro;
    data['livelloAutenticazione'] = this.livelloAutenticazione;
    data['livelloPasswordPolicy'] = this.livelloPasswordPolicy;
    data['mailAddress'] = this.mailAddress;
    data['nascitaData'] = this.nascitaData;
    data['nascitaLuogo'] = this.nascitaLuogo;
    data['nascitaProvincia'] = this.nascitaProvincia;
    data['nome'] = this.nome;
    data['pec'] = this.pec;
    data['professionistaAlbo'] = this.professionistaAlbo;
    data['professionistaEstremiAlbo'] = this.professionistaEstremiAlbo;
    data['residenzaCap'] = this.residenzaCap;
    data['residenzaCitta'] = this.residenzaCitta;
    data['residenzaIndirizzo'] = this.residenzaIndirizzo;
    data['residenzaProvincia'] = this.residenzaProvincia;
    data['residenzaStato'] = this.residenzaStato;
    data['sesso'] = this.sesso;
    data['telefono'] = this.telefono;
    data['tipoSoggetto'] = this.tipoSoggetto;
    data['titolo'] = this.titolo;
    return data;
  }
}