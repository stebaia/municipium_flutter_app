class CivilDefenceLevels {
  bool? datiDomani;
  LivelloAllerta? livelloAllerta;
  Error? error;
  bool? datiOggi;
  List<Rischi>? rischi;

  CivilDefenceLevels(
      {this.datiDomani,
      this.livelloAllerta,
      this.error,
      this.datiOggi,
      this.rischi});

  CivilDefenceLevels.fromJson(Map<String, dynamic> json) {
    datiDomani = json['datiDomani'];
    livelloAllerta = json['livelloAllerta'] != null
        ? new LivelloAllerta.fromJson(json['livelloAllerta'])
        : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    datiOggi = json['datiOggi'];
    if (json['rischi'] != null) {
      rischi = <Rischi>[];
      json['rischi'].forEach((v) {
        rischi!.add(new Rischi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datiDomani'] = this.datiDomani;
    if (this.livelloAllerta != null) {
      data['livelloAllerta'] = this.livelloAllerta!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    data['datiOggi'] = this.datiOggi;
    if (this.rischi != null) {
      data['rischi'] = this.rischi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LivelloAllerta {
  String? criticita;
  String? dataEmissione;
  String? titolo;
  int? codice;
  String? link;
  String? denominazioneLivello;
  String? colore;

  LivelloAllerta(
      {this.criticita,
      this.dataEmissione,
      this.titolo,
      this.codice,
      this.link,
      this.denominazioneLivello,
      this.colore});

  LivelloAllerta.fromJson(Map<String, dynamic> json) {
    criticita = json['criticita'];
    dataEmissione = json['dataEmissione'];
    titolo = json['titolo'];
    codice = json['codice'];
    link = json['link'];
    denominazioneLivello = json['denominazioneLivello'];
    colore = json['colore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['criticita'] = this.criticita;
    data['dataEmissione'] = this.dataEmissione;
    data['titolo'] = this.titolo;
    data['codice'] = this.codice;
    data['link'] = this.link;
    data['denominazioneLivello'] = this.denominazioneLivello;
    data['colore'] = this.colore;
    return data;
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Rischi {
  int? codiceRischio;
  List<LevelDay>? domani;
  String? nomeRischio;
  List<LevelDay>? oggi;

  Rischi({this.codiceRischio, this.domani, this.nomeRischio, this.oggi});

  Rischi.fromJson(Map<String, dynamic> json) {
    codiceRischio = json['codiceRischio'];
    if (json['domani'] != null) {
      domani = <LevelDay>[];
      json['domani'].forEach((v) {
        domani!.add(new LevelDay.fromJson(v));
      });
    }
    nomeRischio = json['nomeRischio'];
    if (json['oggi'] != null) {
      oggi = <LevelDay>[];
      json['oggi'].forEach((v) {
        oggi!.add(new LevelDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codiceRischio'] = this.codiceRischio;
    if (this.domani != null) {
      data['domani'] = this.domani!.map((v) => v.toJson()).toList();
    }
    data['nomeRischio'] = this.nomeRischio;
    if (this.oggi != null) {
      data['oggi'] = this.oggi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LevelDay {
  int? codiceRischio;
  String? dataPrevisione;
  String? criticita;
  String? denominazioneLivello;
  int? codiceLivello;
  String? nomeRischio;
  String? colore;

  LevelDay(
      {this.codiceRischio,
      this.dataPrevisione,
      this.criticita,
      this.denominazioneLivello,
      this.codiceLivello,
      this.nomeRischio,
      this.colore});

  LevelDay.fromJson(Map<String, dynamic> json) {
    codiceRischio = json['codiceRischio'];
    dataPrevisione = json['dataPrevisione'];
    criticita = json['criticita'];
    denominazioneLivello = json['denominazioneLivello'];
    codiceLivello = json['codiceLivello'];
    nomeRischio = json['nomeRischio'];
    colore = json['colore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codiceRischio'] = this.codiceRischio;
    data['dataPrevisione'] = this.dataPrevisione;
    data['criticita'] = this.criticita;
    data['denominazioneLivello'] = this.denominazioneLivello;
    data['codiceLivello'] = this.codiceLivello;
    data['nomeRischio'] = this.nomeRischio;
    data['colore'] = this.colore;
    return data;
  }
}
